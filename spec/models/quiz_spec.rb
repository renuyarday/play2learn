require "spec_helper"

describe Quiz do
  
  before { @quiz = Quiz.create title: "Foo", category: Category.new }
  
  subject { @quiz }
  
  it { should respond_to(:title) }
  it { should respond_to(:category) }

  #it "should return errors if title was not specified" do
  #  b = Quiz.create

  #  b.errors[:title].should == ["can't be blank"]
  #end
  
end