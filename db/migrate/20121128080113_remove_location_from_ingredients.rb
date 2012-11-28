class RemoveLocationFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :location
  end

  def down
    add_column :ingredients, :location, :string
  end
end
