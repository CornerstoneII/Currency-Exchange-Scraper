#!/usr/bin/env ruby
def get_user_data(check_curr_sym)
    input = ''
    loop do
        input = gets.chomp.downcase
        break if check_curr_sym.include?(input) || input.empty?
        puts input + 'No Data Found'
    end
    input
end

puts '

WELCOME TO DAILY EURO CURRENCY EXCHANGE RATE(S)

=================================================

See daily euro exchange rate by simply running this program daily.

press ENTER to continue.
'

gets

puts '.....Fetching Exchange Rate'

scraper = ExchangeScraper.new
scraper.make_connection

if scraper.connected
    puts display_exchange_table
else
    puts ''
    puts "Connection Failed... Check your internet connection"
end

# 7. Display currency rate according to user input data
