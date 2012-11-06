ActiveAdmin.register CateredMeal do
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
      row :phone
      row :address
      row :servings
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Catered Meals" do
      f.input :name
      f.input :thumb, :label => "Image URL"
      f.input :description
      f.input :phone
      f.input :address
      f.input :servings
    end
    f.buttons
  end
end
