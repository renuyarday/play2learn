require "spec_helper"

describe Quiz do
  
  describe "should have the structure" do
    before { @quiz = Quiz.create title: "Foo", category: Category.new }
  
    subject { @quiz }
  
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:category) }
    it { should respond_to(:time) }
  end

  describe "should have validations" do
    before { @quiz = Quiz.create }

    it { @quiz.errors[:title].should == ["can't be blank"] }
    it { @quiz.errors[:description].should == ["can't be blank"] }
    it { @quiz.errors[:category].should == ["can't be blank"] }
    
  end
  
end