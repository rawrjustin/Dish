ActiveAdmin.register Recipe do
  index do
    column :name
    column :description
    column :recipe_type
    column :servings
    column :cost_per_person
    column :time
    default_actions
  end

  filter :name
  filter :description

  show do |recipe|
    attributes_table do
      row :name
      row :image do
        image_tag(recipe.image)
      end
      row :description
      row :recipe_type
      row :directions
      row :time_in_minutes
      row :servings
      table_for recipe.recipe_ingredients do
        column "Ingredients" do |ing|
           ing.amount.to_s + " - " + ing.ingredient.display_name
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Recipe Details" do
      f.input :name
      f.input :image, :label => "Image URL"
      f.input :description
      f.input :recipe_type, :as => :select, :collection => ['Main', 'Sides', 'Soups', 'Salads', 'Desserts'], :include_blank => false
      f.has_many :recipe_ingredients do |ing_f|
        ing_f.input :ingredient
        ing_f.input :amount
        if !ing_f.object.nil?
          ing_f.input :_destroy, :as => :boolean, :label => "Remove?"
        end
      end
      f.input :directions
      f.input :time_in_minutes
      f.input :servings
    end
    f.buttons
  end
end
