ActiveAdmin.register CateredMeal do
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
      row :phone
      row :address
      row :cost
      panel "Available Trays" do
        table_for meal.catered_meal_trays do
          column :name
          column :size
          column :servings
          column :cost
        end
      end
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
      f.input :cost, :as => :select, :collection => ['Under $2', 'Under $5'], :include_blank => false
      f.has_many :catered_meal_trays do |cmt|
        cmt.input :name
        cmt.input :size
        cmt.input :servings
        cmt.input :cost
        if !cmt.object.nil?
          cmt.input :_destroy, :as => :boolean, :label => "Remove?"
        end
      end
    end
    f.buttons
  end
end
