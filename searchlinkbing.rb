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
  query = "#{song} #{artist} youtube"
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
  doc.css('.mc_vtvc_link').each do |li|
    #a_tag = li.at_css('h2 a')
    a_tag = li
    next unless a_tag

    url = a_tag['href']
    #title = a_tag.text.strip
    title = a_tag["aria-label"]
    link_element = li.at_css(".vrhdata") # .at_css('link[rel="dns-prefetch"]')

    if link_element && !link_element.nil?
      link_element= link_element.attribute_nodes[2].value
      next if link_element.nil?
      url = link_element.split("pgurl\":\"")[1]
      next if url.nil?
      url=url.split("\"")[0]
      a_tag = "<a href=\"#{url}\">#{title}</a>"
      #puts a_tag
    else
      #puts "Link element with dns-prefetch not found"
      p "==========="
    end
    next unless url.include?('youtube.com')

    # Form the desired output format
    inner_html = "<a href=\"#{url}\">#{title}</a>"
    results << {
      title: title,
      url: url,
      inner_html: inner_html
    }
  end
  
  # Output the results
  results.each do |result|
    puts "<p>Title: #{result[:title]}</p>"
    puts "<p>URL: #{result[:url]}</p>"

    if result[:url].include?("?v=")
      puts "<p><a href=\"/ajouter.php?lienvid=#{result[:url].split("v=")[1]}&titre=#{result[:title].gsub("(","").gsub(")","").gsub("#","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à mes vidéos</a></p>"
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

@driver.quit

