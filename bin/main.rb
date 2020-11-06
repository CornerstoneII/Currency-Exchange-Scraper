#!/usr/bin/env ruby
require_relative '../lib/scraper'


puts '

WELCOME TO DAILY EURO CURRENCY EXCHANGE RATE(S)

=================================================

See daily euro exchange rate by simply running this program daily.

press ENTER to continue.
'

gets

puts '.....Fetching Exchange Rate'

scraper = ExchangeScraper.new

  table_data = scraper.supply
  table_list = table_data.keys
  exchange_data = table_data['country']

  puts 'Success!'
  puts ''
  puts display_exchange_table(exchange_data)
  puts ''

end
