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

def search_bing(song, artist, score, instrument)
  query = "list of works by #{artist}"
  @driver.navigate.to score

  # Wait for the results to load
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(class: 'external') }
  
  
  # Scrape the results
  results = []
  doc = Nokogiri::HTML(@driver.page_source)
  doc.css('b a').each do |li|
    a_tag = li
    next unless a_tag

    url = a_tag['href']
    title = a_tag.text.strip
    
    link_element = li

    if instrument.split("/").any?{|h|title.downcase.include?(h.downcase)}
      inner_html = "<a href=\"#{url}\">#{artist+" "+title}</a>"
      results << {
        title: li.text,
        url: url,
        inner_html: inner_html
      }



    end
  end
  
  # Output the results
  results.each do |result|
    #puts "<p>Title: #{result[:title]}</p>"
    #puts "<p>URL: #{result[:url]}</p>"
    puts "<p>#{result[:inner_html]}</p>"


  end
  
  # Extracting URL and Title from dns-prefetch link


  # Close the browser
  results
end

# Example songs
songs = [
  { title: ARGV[1], artist: ARGV[0], score: ARGV[2], instrument: ARGV[3] }
]



# Search Bing for each song
songs.each do |song|
  results = search_bing(song[:title], song[:artist], song[:score], song[:instrument])
rescue => e
  p "Ouille"
  p e.message
  p song[:artist]
  p song[:title]
end

@driver.quit

