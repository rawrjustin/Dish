ActiveAdmin.register CookedMenu do
  index do
    column :name
    column :description
    column :phone
    column :address
    column :ingredients
    column :directions
    column :time_in_minutes
    column :type
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
      f.input :type
      f.input :servings
    end
    f.buttons
  end
end
