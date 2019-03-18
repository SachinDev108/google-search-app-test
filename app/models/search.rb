# == Schema Information
#
# Table name: searches
#
#  adwords_link        :integer
#  created_at          :datetime         not null
#  id                  :bigint(8)        not null, primary key
#  keyword_id          :integer
#  raw_html            :text
#  total_number_page   :integer
#  total_search_result :integer
#  updated_at          :datetime         not null
#

class Search < ApplicationRecord
  belongs_to :keyword
  
end
