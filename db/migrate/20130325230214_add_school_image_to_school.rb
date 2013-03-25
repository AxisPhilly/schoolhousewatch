class AddSchoolImageToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :school_image, :string
  end
end
