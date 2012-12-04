class DeleteServingsColumnFromMeals < ActiveRecord::Migration
  def up
    remove_column :meals, :servings
  end

  def down
    add_column :meals, :servings, :integer
  end
end
