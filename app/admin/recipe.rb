ActiveAdmin.register Recipe do
  index do
    column :name
    column :description
    column :recipe_type
    column :servings
    default_actions
  end

  filter :name
  filter :description

  form do |f|
    f.inputs "Recipe Details" do
      f.input :name
      f.input :image, :label => "Image URL"
      f.input :description
      f.input :recipe_type, :as => :select, :collection => ['Main', 'Sides', 'Soups', 'Salads', 'Desserts'], :include_blank => false
      f.input :ingredients
      f.input :directions
      f.input :time_in_minutes
      f.input :servings
      f.input :total_cost
    end
    f.buttons
  end
end
