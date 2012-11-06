class AddThumbToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :thumb, :string
  end
end
