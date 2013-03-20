class AddContextToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :context, :str
  end
end
