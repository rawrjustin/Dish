ActiveAdmin.register CookedMenu do
  index do
    column :name
    column :description
    column :servings
    default_actions
  end

  filter :name
  
  form do |f|
    f.inputs "Cooked Menus" do
      f.input :name
      f.input :description
      f.input :phone
      f.input :address
      f.input :ingredients
      f.input :directions
      f.input :time_in_minutes
      f.input :servings
    end
    f.buttons
  end
end
