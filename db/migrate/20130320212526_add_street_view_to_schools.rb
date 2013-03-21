class AddStreetViewToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :street_view, :text, :limit => nil
  end
end
