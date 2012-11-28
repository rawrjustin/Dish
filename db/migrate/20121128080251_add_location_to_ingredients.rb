class AddLocationToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :location_id, :integer
  end
end
