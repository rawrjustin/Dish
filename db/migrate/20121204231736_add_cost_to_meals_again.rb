class AddCostToMealsAgain < ActiveRecord::Migration
  def change
    add_column :meals, :cost, :string
  end
end
