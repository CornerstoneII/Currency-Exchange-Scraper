require 'httparty'
require 'nokogiri'
require 'byebug'

class ExchangeScraper
    attr_reader :unparsed_page, :parsed_page, :connection

    def initialize(url = 'https://www.iban.com/exchange-rates')
      @url = url
      @unparsed_page = nil
      @parsed_page = nil
      @connection = false
    end

    def try_connecting
        begin
          @unparsed_page = HTTParty.get(@url)
          @parsed_page = Nokogiri::HTML(@unparsed_page)
          @connection = true
        rescue StandardError
          @connection = false
        end
          @connection
    end

    def exchangeList
      @parsed_page.css('table.table > tbody > tr')
    end

    def supply
        all_exchange = Array.new
        exchangeList.each do |e|
            curr_item = {
                currency: e.css('td')[0].text.split(' ')[0].gsub('\t',''),
                currency_name: e.css('td')[1].text,
                exchangeRate: e.css('td')[2].text.to_f,
            }
            all_exchange << curr_item
          end
    end
end
