class RemoveTotalCostFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :total_cost
  end

  def down
    add_column :recipes, :total_cost, :decimal
  end
end
