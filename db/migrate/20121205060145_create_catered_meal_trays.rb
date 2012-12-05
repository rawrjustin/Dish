class CreateCateredMealTrays < ActiveRecord::Migration
  def change
    create_table :catered_meal_trays do |t|
      t.integer :catered_meal_id
      t.string :name
      t.string :size
      t.integer :servings
      t.decimal :cost
      t.timestamps
    end
  end
end
