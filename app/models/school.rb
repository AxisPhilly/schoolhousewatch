class School < ActiveRecord::Base
  attr_accessible :address, :code, :lat, :level, :lng, :mkt_val_2014, :name, :opa, :url, :slug
end
