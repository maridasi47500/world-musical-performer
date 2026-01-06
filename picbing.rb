require 'nokogiri'
require "json"
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require 'i18n'

agent = Mechanize.new

@driver = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser
@driver.navigate.to "https://www.bing.com/images"

def search_bing(song, artist)
  query = "scores #{artist} #{song}"
  @driver.navigate.to "https://www.bing.com/images"

  # Wait for the results to load
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(name: 'q') }
  
  # Search for the query
  search_box = @driver.find_element(name: 'q')
  search_box.send_keys(query)
  search_box.submit
  
  wait.until { @driver.title.include?("scores #{artist.strip} #{song.strip}") and @driver.find_element(class: 'mimg')  }
  
  # Scrape the results
  results = []
  doc = Nokogiri::HTML(@driver.page_source)
  doc.css('img.mimg').each do |li|
    a_tag = li
    next unless a_tag

    url = a_tag['src']
    next if url.to_s.strip == ""
    title = artist+" "+song
    
    link_element = li


    inner_html = "<img width=100 height=150 src=\"#{li["src"]}\" alt=\"resultat pour #{artist} #{song}\"/>"
    results << {
      title: title,
      url: li["src"],
      inner_html: inner_html
    }

  end
  
  # Output the results
  results.each do |result|
    puts "<p>Title: #{result[:title]}</p>"
    puts "<p>URL: #{result[:url]}</p>"
    puts "<p>#{result[:inner_html]}</p>"

    if result[:url]
      puts "<p><a href=\"/ajouterpic.php?lien=#{result[:url].split("v=")[1]}&titre=#{result[:title].gsub("(","").gsub(")","").gsub("#","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à mes images</a></p>"
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

