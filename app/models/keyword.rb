# == Schema Information
#
# Table name: keywords
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  name       :string
#  updated_at :datetime         not null
#  user_id    :integer
#

class Keyword < ApplicationRecord
  has_many :searches

  def process_search
    GoogleSpider.value = self.name.gsub(" ","+")+"+"
    response = GoogleSpider.crawl!
    data = JSON.parse(File.read(Rails.root + "searches.json")) 
    self.searches.build(data[0].except('position')).save
  end
end
