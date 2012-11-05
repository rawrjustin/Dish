ActiveAdmin.register CateredMeal do
  index do
    column :name
    column :description
    column :phone
    column :address
    column :servings
    default_actions
  end

  filter :name
  
  form do |f|
    f.inputs "Catered Meals" do
      f.input :name
      f.input :description
      f.input :phone
      f.input :address
      f.input :servings
    end
    f.buttons
  end
end
