require "spec_helper"

describe "Question" do

  it "should return errors if question text was not specified" do
    b = Question.create

    b.errors[:ques_text].should == ["can't be blank"]
  end

  it "should return errors if answer options was not specified" do
    b = Question.create

    b.errors[:answer.length < 4].should == ["can't be less then 4"]
  end

  it "should return errors if correct answer index was not specified" do
    b = Question.create

    b.errors[:correct_ans_index].should == ["can't be blank"]
  end

  it "should return errors if Hint was not specified" do
    b = Question.create

    b.errors[:hint].should == ["can't be blank"]
  end

  it "should return errors if quiz was not specified" do
    b = Question.create

    b.errors[:quiz].should == ["can't be blank"]
  end

end