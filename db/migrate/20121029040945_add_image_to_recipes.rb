class AddImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image, :string, :default => "fooddefault.png"
  end
end
