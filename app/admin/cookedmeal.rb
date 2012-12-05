ActiveAdmin.register CookedMeal do
  index do
    column :name
    column :description
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
      row :directions
      row :time
      row :cost
      panel "Ingredients" do
        table_for meal.cooked_meal_ingredients do
          column :amount
          column :ingredient
          column "price" do |i| "$" + i.ingredient.price.to_s end
          column "location" do |i| i.ingredient.location.name end
          column "notes" do |i| i.ingredient.notes end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Cooked Meals" do
      f.input :name
      f.input :thumb, :label => "Image URL"
      f.input :description
      f.has_many :cooked_meal_ingredients do |ing_f|
        ing_f.input :ingredient
        ing_f.input :amount
        if !ing_f.object.nil?
          ing_f.input :_destroy, :as => :boolean, :label => "Remove?"
        end
      end
      f.input :directions
      f.input :time_in_minutes
    end
    f.buttons
  end
end
