#!/usr/bin/env ruby
def get_user_data(check_curr_key)
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
    table_data = scraper.supply
    table_list = table_data.keys
    exchange_data = table_data['country']

    puts 'Success!'
    puts ''
    puts display_exchange_table(exchange_data)
    puts''
    loop do
        puts 'Fetch Current Rate by Currency Symbol'
        puts 'Example: <USD, JPY, GBP, ZAR>'
        user_choice = get_user_data(curr_key)
        break if user_choice.empty?

        puts ''
        country_data = table_data[user_choice]
        puts display_exchange_table(country_data, user_choice)
    end
else
    puts ''
    puts "Connection Failed... Check your internet connection"
end

