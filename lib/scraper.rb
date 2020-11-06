require 'httparty'
require 'nokogiri'
require 'byebug'

class ExchangeScraper
    attr_reader :parsed_page

    def initialize
      url = 'https://www.iban.com/exchange-rates'
      unparsed_page = HTTParty.get(url)
      @parsed_page ||= Nokogiri::HTML(unparsed_page)
    end

    def get_data
      exchangeList.each do |e|
        curr_item = {
            currency: e.css('td')[0].text.split(' ')[0].gsub('\t',''),
            currency_name: e.css('td')[1].text,
            exchangeRate: e.css('td')[2].text.to_f,
        }
        all_exchange << curr_item
      end
    end

    private

    def exchangeList
      parsed_page.css('table.table > tbody > tr')
    end

    scraper = ExchangeScraper.new
    currency = scraper.get_currency
    currency_name = scraper.get_currency_name
    exchange_rate = scraper.get_exchange_rate

  (0...exchange_rate.size).each do |index|
    puts "- - - index: #{index + 1} - - -"
    puts "Currency: #{currency[index]} | Currency Name: #{currency_name[index]} | Exchange Rate: #{exchange_rate[index]}"
  end
end
