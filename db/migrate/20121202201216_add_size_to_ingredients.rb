class AddSizeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :size, :string, :default => ""
  end
end
