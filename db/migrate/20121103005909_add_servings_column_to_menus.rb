class AddServingsColumnToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :servings, :integer
  end
end
