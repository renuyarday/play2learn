require "spec_helper"

describe Question do
  before { @question = Question.create question_text:"Foo",
       correct_answer_hint: "anything", 
       incorrect_answer_hint:"nothing", book: Book.new, hint: "Foo", quiz: Quiz.new }

  describe "should have the structure" do
  
    subject { @question }
  
    it { should respond_to(:question_text) }
    it { should respond_to(:correct_answer_hint) }
    it { should respond_to(:incorrect_answer_hint) }
  end
  
  describe "should validate" do
    before { @question = Question.create }
    
    it { @question.errors[:question_text].should == ["can't be blank"] }
    it { @question.errors[:answers].should == ["A question must have at least one answer"] }

  end

  #it "should ensure the one answer is selected as the correct answer" do
  #  @question.answers << Answer.create(:answer_text => "Q1")
  #  @question.answers << Answer.create(:answer_text => "Q2")
  #
  #  @question.errors[:answers].should == "One answer must be selected as the correct answers"
  #end

end