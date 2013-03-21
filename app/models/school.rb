class School < ActiveRecord::Base
  #mount_uploader :school_image, SchoolImageUploader

  attr_accessible :address, :code, :lat, :level, :lng, :mkt_val_2014, :name, :opa, :url, :slug, :school_image, :context, :street_view
end
