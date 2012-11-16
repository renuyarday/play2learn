require "spec_helper"

describe Question do
  
  describe "should have the structure" do
    before { @question = Question.create question_text:"Foo",
      answers: [], correct_answer_index: 1, book: Book.new, hint: "Foo", quiz: Quiz.new }
  
    subject { @question }
  
    it { should respond_to(:question_text) }
    it { should respond_to(:answers) }
    it { should respond_to(:correct_answer_index) }
    it { should respond_to(:book) }
    it { should respond_to(:hint) }
    it { should respond_to(:quiz) }
  end
  
  describe "should have validations" do
    before { @question = Question.create }
    
    it { @question.errors[:question_text].should == ["can't be blank"] }
  
    it { @question.errors[:answers].should == ["A question must have at least one answer"] }
  
    it { @question.errors[:correct_answer_index].should == ["can't be blank"] }
  
    it { @question.errors[:hint].should == ["can't be blank"] }
  
    it { @question.errors[:quiz].should == ["can't be blank"] }
  end

end