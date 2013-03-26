class RemoveSchoolImageUploaderFromSchool < ActiveRecord::Migration
  def up
  	remove_column :schools, :school_image
  end

  def down
	add_column :schools, :school_image, :string
  end
end
