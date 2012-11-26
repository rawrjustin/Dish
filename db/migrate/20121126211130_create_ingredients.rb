class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :location
      t.float :price
      t.string :photo
      t.text :notes

      t.timestamps
    end
  end
end
