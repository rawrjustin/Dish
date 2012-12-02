class CreateCookedMealIngredients < ActiveRecord::Migration
  def change
    create_table :cooked_meal_ingredients do |t|
      t.string :cooked_meal_id
      t.string :ingredient_id
      t.integer :amount
      t.timestamps
    end
    remove_column :meals, :ingredients
  end
end
