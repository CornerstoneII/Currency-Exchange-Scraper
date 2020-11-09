require './lib/scraper'

describe ShopScraper do
  describe '#display_names' do
    it 'returns an array of product names' do
      names = ShopScraper.new
      expect(names.display_names).to be_an_instance_of(Array)
    end
  end

  describe 'the #display_prices method' do
    it 'returns an array of product prices' do
      prices = ShopScraper.new
      expect(prices.display_prices).to be_an_instance_of(Array)
    end
  end
end
