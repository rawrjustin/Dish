class RemoveCostFromMeals < ActiveRecord::Migration
  def up
    remove_column :meals, :cost
  end

  def down
    add_column :meals, :cost, :string
  end
end
