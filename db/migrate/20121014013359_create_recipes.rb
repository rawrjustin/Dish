class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.text :directions
      t.integer :time_in_minutes
      t.integer :servings
      t.decimal :total_cost
      t.timestamps
    end
  end
end
