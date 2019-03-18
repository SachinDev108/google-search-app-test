require 'kimurai'

class GoogleSpider < Kimurai::Base
  cattr_accessor :value
  @name = "google_spider"
  @engine = :selenium_chrome
  @start_urls = ["https://www.google.com/search?q=#{binding.pry}&btnK=Google+Search&oq=#{GoogleSpider.value}"]
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    before_request: { delay: 4..7 }
  }

  def parse(response, url:, data: {})
    item = {}
    item[:adwords_link] = response.xpath("//li[@class='ads-ad']").size
    item[:total_search_result] = response.xpath("//div[@id='resultStats']").wrap("results")[0].children[0].to_s.scan(/\d/).join('')
    item[:total_number_page] = response.xpath("//a").size  
    item[:raw_html] = response.to_s   
    save_to "searches.json", item, format: :pretty_json      
  end
end

