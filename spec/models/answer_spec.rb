require "spec_helper"

describe Answer do
  
  describe "should have the structure" do
    before { @answer = Answer.create answer_text:"Foo",
      is_correct:true, hint:"right" }
  
    subject { @answer }
  
    it { should respond_to(:answer_text) }
    it { should respond_to(:is_correct) }
    it { should respond_to(:hint)}
  end
  
  describe "should validate" do
    before { @answer = Answer.create }
    
    it { @answer.errors[:answer_text].should == ["can't be blank"] }
    it {@answer.errors[:hint].should == ["can't be blank"]} 
  end

end