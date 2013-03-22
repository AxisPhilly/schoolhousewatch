class AddContextToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :context, :text, :limit => nil
  end
end
