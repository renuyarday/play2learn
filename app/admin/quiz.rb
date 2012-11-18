ActiveAdmin.register Quiz do
  menu priority: 4

  index do
    column :title
    column :category
    default_actions
  end

  show do |quiz|
    attributes_table do
      row :title
      row "Category" do
        quiz.category.name
      end
   end
   render "questions"
 end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :category, :as => :select
    end
    f.buttons
  end
end