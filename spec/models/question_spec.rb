require "spec_helper"

describe Question do
  before { @question = Question.create question_text:"Foo",
              book: Book.new, hint: "Foo", quiz: Quiz.new }

  describe "should have the structure" do
  
    subject { @question }
  
    it { should respond_to(:question_text) }
   
  end
  
  describe "should validate" do
    before { @question = Question.create }
    
    it { @question.errors[:question_text].should == ["can't be blank"] }
    it { @question.errors[:answers].should == ["A question must have at least one answer"] }

  end

  it "should create a question with valid params" do
    question = Question.create(:question_text => "Who is batman", :answers => { 0 => {:answer_text => "Me", :hint => "dumb ass read this book", :is_correct => false}, 
                                                                                1 => {:answer_text => "Batman", :hint => "finally", :is_correct => true}, 
                                                                                2 => {:answer_text =>"you", :hint => "ha ha ha", :is_correct => false}})
    question.should be_persisted
  end

end