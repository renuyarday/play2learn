require "spec_helper"

describe Quiz do

  before :each do
    Quiz.delete_all
    @quiz = Quiz.create title: "Foo", :description => "Foo Quiz"
  end

  subject { @quiz }

  describe "should have the structure" do
      
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:categories) }
    it { should respond_to(:status) }
    it { should respond_to(:duration) }

  end

  describe "should have validations" do
    before { @quiz = Quiz.create }

    it { @quiz.status.should == "Draft" }
    it { @quiz.duration.should == Settings.quiz.duration }
    it { @quiz.errors[:title].should == ["can't be blank"] }
    it { @quiz.errors[:description].should == ["can't be blank"] }
    it { @quiz.errors[:categories].should == ["can't be blank"] }

  end
  
  it "cannot be re-published" do 
    @quiz.publish
    expect { @quiz.publish }.to raise_error
  end

  it "should indicate if its published" do
    @quiz.publish
    @quiz.published?.should == true
  end

  it "should be marked deleted when delete is performed" do
    refresh_categories

    @quiz.categories = [Category.first]
    @quiz.save!
    Quiz.all.count.should == 1

    @quiz.delete
    Quiz.all.count.should == 0
    
    Quiz.where(:deleted_at.exists => true, :title => 'Foo').count.should == 1
  end

end