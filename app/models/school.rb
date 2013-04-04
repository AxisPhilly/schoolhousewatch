class School < ActiveRecord::Base

  attr_accessible :address, :code, :lat, :level, :lng, :mkt_val_2014, 
  :name, :opa, :url, :slug, :flickr_image, :flickr_image_url, :context, :street_view

  default_scope order('name ASC')

  def self.find(input)
    if input.to_i != 0
      super
    else
      find_by_slug(input)
    end
  end
end
