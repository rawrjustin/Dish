class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      #common fields
      t.string :name
      t.text :description
      #Catered fields
      t.integer :phone
      t.string :address
      #Cooked fields
      t.text :ingredients
      t.text :directions
      t.integer :time_in_minutes
      #extra fields
      t.string :type
      t.timestamps
    end
  end
end
