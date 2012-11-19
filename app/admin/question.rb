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
      f.input :correct_answer_hint, :as => :rich, :config => { :width => '76%', :height => '100px' }
      f.input :incorrect_answer_hint, :as => :rich, :config => { :width => '76%', :height => '100px' }
      f.input :quiz, :as => :select
      #f.inputs :answer_text, :is_correct, :as =>:radio, :collection => ["True", "False"], :for => :answers, :name => 'Answer-1 #%i'
      #f.inputs :answer_text, :is_correct, :for => :answers, :name => 'Answer-2 #%i'
      #f.inputs :answer_text, :is_correct, :for => :answers, :name => 'Answer-3 #%i'
      #f.inputs :answer_text, :is_correct, :for => :answers, :name => 'Answer-4 #%i'
    end
    f.buttons
  end
end