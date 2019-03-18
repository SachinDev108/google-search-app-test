# == Schema Information
#
# Table name: keywords
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Keyword < ApplicationRecord
  has_many :searches

  def process_search
    response = GoogleSpider.crawl!
    self.searches.build(response)
  end
end
