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
      @driver.find_elements(:tag_name, "a").each do |mylink|
          hello=false
          song.downcase.split(" ").each do |wow|
              #p mylink.attribute("href")
              next if mylink.attribute("href").nil?
              if mylink.attribute("href").scan(/#{wow.split('').map{|h|"[#{h.downcase}#{h.upcase}]"}.join('')}/).length > 0
                  hello=true

              end
              #p "$('a').toArray().filter((x) => (new RegExp('(#{wow.split('').map{|h|"[#{h.downcase}#{h.upcase}]"}.join('')})', 'i')).test(x.href)).map(x=>window.open(x))"
              #@driver.execute_script("$('a').toArray().filter((x) => (new RegExp('(#{wow.split("").map{|h|"[#{h.downcase}#{h.upcase}]"}.join("")})', 'i')).test(x.href)).map(x=>window.open(x))")
              #sleep 0.5
          end
          if hello == true
              inner_html = "<a href=\"#{mylink.attribute("href")}\">#{mylink.text}</a>"
              results << {
                title: mylink.text,
                url: mylink.attribute("href"),
                inner_html: inner_html
              }
          end
      end

      #puts a_tag
      p "==========="



    end
  end
  
  # Output the results
  results.each do |result|
    puts "<p>Title: #{result[:title]}</p>"
    puts "<p>URL: #{result[:url]}</p>"

    if result[:url]
      puts "<p><a href=\"/ajouterscore.php?composer=#{artist}&lien=#{result[:url]}&titre=#{result[:title].gsub("(","").gsub(")","").gsub("#","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à mes partitions</a></p>"
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



# Search Bing for each song
songs.each do |song|
  p "<p>"
  p "Artist\/composer's name : " + song[:artist]
  p "</p><p>"
  p "title : " + song[:title]
  p "</p>"
  results = search_bing(song[:title], song[:artist])
rescue => e
  p "Ouille"
  p e.message
  p song[:artist]
  p song[:title]
end

@driver.quit

