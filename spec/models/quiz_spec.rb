require "spec_helper"

describe Quiz do
  before { @quiz = Quiz.create title: "Foo", :description => "Foo Quiz", category: Category.new }

  subject { @quiz }

  describe "should have the structure" do
      
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:category) }
    it { should respond_to(:status) }
  end

  describe "should have validations" do
    before { @quiz = Quiz.create }

    it { @quiz.status.should == "Draft" }
    it { @quiz.errors[:title].should == ["can't be blank"] }
    it { @quiz.errors[:description].should == ["can't be blank"] }
    it { @quiz.errors[:category].should == ["can't be blank"] }
  end
  
  it "cannot be re-published" do 
    @quiz.publish
    expect { @quiz.publish }.to raise_error
  end

  it "should indicate if its published" do
    @quiz.publish
    @quiz.published?.should == true
  end

end