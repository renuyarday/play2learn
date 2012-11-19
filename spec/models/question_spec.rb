require "spec_helper"

describe Question do
  
  describe "should have the structure" do
    before { @question = Question.create question_text:"Foo",
       correct_answer_hint: "anything", incorrect_answer_hint:"nothing", book: Book.new, hint: "Foo", quiz: Quiz.new }
  
    subject { @question }
  
    it { should respond_to(:question_text) }
    it { should respond_to(:correct_answer_hint) }
    it { should respond_to(:incorrect_answer_hint) }
  end
  
  #describe "should validate" do
  #  before { @question = Question.create }
    
  #  it { @question.errors[:question_text].should == ["can't be blank"] }
  
  #  it { @question.errors[:answers].should == ["A question must have at least one answer"] }
    
    #it "to ensure that each associated answer has a text and comment" do 
    #  @question.answers = { :a1 => {}, :a2 => {} }
    #  @question.errors[:answers].should == [] 
    #end
  
  #  it { @question.errors[:correct_answer_index].should == ["can't be blank"] }
  
  #  it { @question.errors[:hint].should == ["can't be blank"] }
  
  #  it { @question.errors[:quiz].should == ["can't be blank"] }
  #end

end