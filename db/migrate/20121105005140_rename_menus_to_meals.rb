class RenameMenusToMeals < ActiveRecord::Migration
  def up
    rename_table :menus, :meals
  end
end
