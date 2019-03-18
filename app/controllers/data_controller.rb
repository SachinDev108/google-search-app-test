class DataController < ApplicationController
  def importer

      csv_data = CSV.read(params["csv_file"].path).flatten.compact
      keywords = csv_data.length
      if keywords > 1 && keywords < 100
         csv_data.each do |value|
           Keyword.find_or_create_by(name: value,user_id: current_user.id).process_search
         end
      else
          redirect_to '/importer', error: "Please upload CSV with keywords between 1-99"
      end
  end

end
