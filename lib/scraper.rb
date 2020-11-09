require 'httparty'
require 'nokogiri'
require 'byebug'

class ShopScraper
  attr_accessor :parse_page

  def initialize
    doc = HTTParty.get('http://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3')
    @parse_page ||= Nokogiri::HTML(doc)
  end

  def display_names
    item_container.css('.product-card__titles').css('.product-card__title').children.map{ |name| name.text }.compact
  end

  def display_prices
    item_container.css('.product-card__price').css('div.product-price').children.map{ |price| price.text }.compact
  end

  private

  def item_container
    @parse_page.css('.product-card__info')
  end
end
