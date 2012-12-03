class RecreateCookedMealIngredientTable < ActiveRecord::Migration
  def change
    drop_table :cooked_meal_ingredients
    create_table :cooked_meal_ingredients do |t|
      t.integer :cooked_meal_id
      t.integer :ingredient_id
      t.integer :amount
      t.timestamps
    end
  end
end
