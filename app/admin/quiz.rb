ActiveAdmin.register Quiz do
  
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
   panel "Questions" do
      unless quiz.questions.empty?
        table_for(quiz.questions) do
          column('Question')   { |question| question.question_text }           
        end
      end
    end
 end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Category Details" do
      f.input :title
      f.input :category, :as => :select
    end
    f.buttons
  end
end