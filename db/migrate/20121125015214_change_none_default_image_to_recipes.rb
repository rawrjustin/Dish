class ChangeNoneDefaultImageToRecipes < ActiveRecord::Migration
  def up
    change_column :recipes, :image, :string, :default => nil
  end

  def down
  end
end
