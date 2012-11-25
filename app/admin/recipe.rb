ActiveAdmin.register Recipe do     
  index do
    column "image" do |recipe|
      image_tag recipe.image.to_s, :width => '256'
    end    
    column :id
    column :name
    column :description
    column :ingredients
    column :directions
    column :time_in_minutes
    column :servings
    column :total_cost
    default_actions                   
  end                                 

  filter :name
  filter :description

  form do |f|                         
    f.inputs "Recipe Details" do
      f.input :name
      f.input :description
      f.input :ingredients
      f.input :directions
      f.input :time_in_minutes
      f.input :servings
      f.input :total_cost
      f.input :image, :placeholder => "Put link to image here"
    end
    f.buttons                         
  end
end
