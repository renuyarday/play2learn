require "spec_helper"

describe "Category" do

  it "should return errors if name not specified" do
    c = Category.create
    c.errors[:name].should == ["can't be blank"]
  end

  it "should return errors if badge image not specified" do
    c = Category.create :name => "Foo"
    c.errors[:badge_image].should == ["can't be blank"]
  end

end