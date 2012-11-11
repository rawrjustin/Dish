ActiveAdmin.register CookedMeal do
  index do
    column :name
    column :description
    column :servings
    default_actions
  end

  filter :name

  show do |meal|
    attributes_table do
      row :name
      row :image do
        image_tag(meal.thumb)
      end
      row :description
      row :ingredients
      row :directions
      row :time_in_minutes
      row :servings
      row :cost
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Cooked Meals" do
      f.input :name
      f.input :thumb, :label => "Image URL"
      f.input :description
      f.input :ingredients
      f.input :directions
      f.input :time_in_minutes
      f.input :servings
      f.input :cost, :as => :select, :collection => ['Under $2', 'Under $5'], :include_blank => false
    end
    f.buttons
  end
end
