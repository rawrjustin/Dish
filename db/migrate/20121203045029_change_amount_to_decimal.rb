class ChangeAmountToDecimal < ActiveRecord::Migration
  def change
    change_column :cooked_meal_ingredients, :amount, :decimal
  end
end
