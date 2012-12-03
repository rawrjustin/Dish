class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.decimal :amount
      t.timestamps
    end
    remove_column :recipes, :ingredients
  end
end
