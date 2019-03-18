class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :keyword_id
      t.text :raw_html
      t.integer :total_search_result
      t.integer :total_number_page
      t.integer :adwords_link

      t.timestamps
    end
  end
end
