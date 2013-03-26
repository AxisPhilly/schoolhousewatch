class AddFlickrToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :flickr_image, :string
    add_column :schools, :flickr_image_url, :string
  end
end
