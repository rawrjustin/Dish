ActiveAdmin.register Ingredient do
  index do
    column "photo" do |ingredient|
      image_tag ingredient.photo.to_s, :width => '64'
    end
    column :id 
    column :name
    column "location" do |ingredient|
      ingredient.location.display_name
    end
    column :price
    column :notes
    default_actions
  end

  form do |f|
    f.inputs "Ingredient Details" do
      f.input :name
      f.input :location
      f.input :price
      f.input :photo
      f.input :notes
    end
    f.buttons
  end
end
