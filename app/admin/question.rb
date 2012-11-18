ActiveAdmin.register Question do
  menu false

  index do
  	"Foo"
  end

  show :title => :question_text do |category|
    attributes_table do
      row :question_text
      row "Correct Answer" do |category|
        "TBD"
      end
      row :hint
      row "Quiz" do |question|
      	question.quiz.title
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Question Details" do
      f.input :question_text
      f.input :hint
      f.input :quiz, :as => :select
    end
    f.buttons
  end
end