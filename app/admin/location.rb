ActiveAdmin.register Location do
  index do
    column :id
    column :name
    column :city
    default_actions
  end

  filter :name
  filter :city

  form do |f|
    f.inputs "Location Details" do 
      f.input :name
      f.input :city
      f.input :address1
      f.input :address2
      f.input :tel
    end
    f.buttons
  end
end
