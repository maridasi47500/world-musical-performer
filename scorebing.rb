require 'nokogiri'
require "json"
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require 'i18n'

agent = Mechanize.new

@driver = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser
@driver.navigate.to "https://www.bing.com"

def search_bing(song, artist)
  query = "list of works by #{artist}"
  @driver.navigate.to "https://www.bing.com"

  # Wait for the results to load
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(name: 'q') }
  
  # Search for the query
  search_box = @driver.find_element(name: 'q')
  search_box.send_keys(query)
  search_box.submit
  
  wait.until { @driver.find_element(css: 'li.b_algo') }
  
  # Scrape the results
  results = []
  doc = Nokogiri::HTML(@driver.page_source)
  doc.css('h2 a').each do |li|
    a_tag = li
    next unless a_tag

    url = a_tag['href']
    title = a_tag.text.strip
    
    link_element = li

    if title.include?("List of works")
      @driver.navigate.to url
      doc1 = Nokogiri::HTML(@driver.page_source)
      wait.until { @driver.find_element(:id=>"firstHeading") }
      song.downcase.split(" ").each do |wow|
          p wow.split('').map{|h|"[#{h.downcase}#{h.upcase}]"}.join('')
          p "$('a').toArray().filter((x) => (new RegExp('(#{wow.split('').map{|h|"[#{h.downcase}#{h.upcase}]"}.join('')})', 'i')).test(x.href)).map(x=>window.open(x))"
          @driver.execute_script("$('a').toArray().filter((x) => (new RegExp('(#{wow.split("").map{|h|"[#{h.downcase}#{h.upcase}]"}.join("")})', 'i')).test(x.href)).map(x=>window.open(x))")
          sleep 0.5
      end

      #puts a_tag
      p "==========="
    end
    original_window = @driver.window_handle
    @driver.window_handles.each do |handle|
    if handle != original_window
        @driver.switch_to.window handle
    end
    p handle

    # Form the desired output format
    inner_html = "<a href=\"#{handle.url}\">#{handle.title}</a>"
    results << {
      title: handle.title,
      url: handle.url,
      inner_html: ""
    }
    end
  end
  
  # Output the results
  results.each do |result|
    puts "<p>Title: #{result[:title]}</p>"
    puts "<p>URL: #{result[:url]}</p>"

    if result[:url].include?("?v=")
      puts "<p><a href=\"/ajouterscore.php?lien=#{result[:url].split("v=")[1]}&titre=#{result[:title].gsub("(","").gsub(")","").gsub("#","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à mes vidéos</a></p>"
    end
    puts "<br>"
    puts "-" * 40
    puts "<hr>"

  end
  
  # Extracting URL and Title from dns-prefetch link


  # Close the browser
  results
end

# Example songs
songs = [
  { title: ARGV[1], artist: ARGV[0] }
]

p songs

# Search Bing for each song
songs.each do |song|
  results = search_bing(song[:title], song[:artist])
rescue => e
  p "Ouille"
  p e.message
  p song[:artist]
  p song[:title]
end

#@driver.quit

