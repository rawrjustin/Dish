ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :author
    column :created_at
    column :updated_at
    default_actions
  end

  filter :title
  filter :author

  form do |f|
    f.inputs "Post Details" do
      f.input :title
      f.input :thumb, :label => "Image URL"
      f.input :author
      f.input :content
    end
    f.buttons
  end
end
