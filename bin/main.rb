#!/usr/bin/env ruby
require_relative '../lib/scraper'

puts '

WELCOME TO SPLENDID ONLINE PRODUCT CRAWLER

=================================================

FIND YOUR FAVORITE SNEAKER WITH THEIR NAME AND ASSOCIATED PRICES.

press ENTER to continue.
'

gets

puts '.....Fetching Store Data'

scraper = ShopScraper.new
names = scraper.display_names
prices = scraper.display_prices

(0...prices.size).each do |index|
  puts "--- index: #{index + 1}---"
  puts "Name: #{names[index]} | Price: #{prices[index]}"
end
