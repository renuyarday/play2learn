require "spec_helper"

describe Quiz do
  
  describe "should have the structure" do
    before { @quiz = Quiz.create title: "Foo", category: Category.new }
  
    subject { @quiz }
  
    it { should respond_to(:title) }
    it { should respond_to(:category) }
  end
  #it "should return errors if title was not specified" do
  #  b = Quiz.create

  #  b.errors[:title].should == ["can't be blank"]
  #end
  
  describe "should have validations" do
    before { @quiz = Quiz.create }
    
    it { @quiz.errors[:title].should == ["can't be blank"] }
  
    it { @quiz.errors[:category].should == ["can't be blank"] }
    
  end
  
end