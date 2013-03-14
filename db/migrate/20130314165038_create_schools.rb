class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :code
      t.string :name
      t.string :address
      t.string :url
      t.string :level
      t.decimal :lat, :precision => 6, :scale => 4
      t.decimal :lng, :precision => 6, :scale => 4
      t.string :opa
      t.integer :mkt_val_2014

      t.timestamps
    end
  end
end
