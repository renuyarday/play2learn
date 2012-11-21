require "spec_helper"

describe Answer do
  
  describe "should have the structure" do
    before { @answer = FactoryGirl.build :answer }
  
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
  
  describe "should validate" do
   before{ 
      Question.delete_all
      @question = Question.create(:question_text => "what is ruby?", :answers => { 0 => {:answer_text => "Me", :hint => "dumb ass read this book", :is_correct => false}, 
                                                                     1 => {:answer_text => "Batman", :hint => "finally", :is_correct => true}})
       @answer = Answer.create(:answer_text => "Batman", :hint => "finally", :is_correct => false, :question => @question)                                                              
         }
    it { @answer.errors[:answer_text].should == ["has already been added!"] }                                                            
  end
  

end