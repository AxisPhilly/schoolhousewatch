# Load the 23 schools that will be closed at the end of the 2013 school year
require 'csv'

namespace :db do
  task :import => :environment do
    School.delete_all
    
    CSV.foreach("#{Rails.root.to_s}/lib/assets/schools.csv", {:headers => true, :col_sep => "\|"}) do |row|
      school = School.new
      school.code = row["school_code"]
      school.name = row["school_name"]
      school.address = row["address"]
      school.level = row["school_level_name"]
      school.url = row["url"]
      school.lat = row["lat"]
      school.lng = row["lng"]
      school.opa = row["opa"]
      school.mkt_val_2014 = row["mkt_val_2014"]
      school.slug = row["slug"]
      school.street_view = row["street_view"]
      school.save

      puts school
    end
  end
end