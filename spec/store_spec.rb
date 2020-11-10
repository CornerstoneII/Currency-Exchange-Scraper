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

  describe 'the #display_prices method' do
    it 'does not raise error when it returns match array' do
      prices = ShopScraper.new
      expect(prices.display_prices).to match(['$120',
                                              + '$130',
                                              + '$150',
                                              + '$190',
                                              + '$140',
                                              + '$190',
                                              + '$190',
                                              + '$170',
                                              + '$160',
                                              + '$120',
                                              + '$160',
                                              + '$200',
                                              + '$180',
                                              + '$140',
                                              + '$120',
                                              + '$150',
                                              + '$80',
                                              + '$75',
                                              + '$190',
                                              + '$130',
                                              + '$170',
                                              + '$140',
                                              + '$140',
                                              + '$140'])
    end
  end
end
