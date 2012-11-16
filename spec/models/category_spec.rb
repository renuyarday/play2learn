require "spec_helper"

describe "Category" do
  before { Category.delete_all }

  it "should return errors if name not specified" do
    c = Category.create
    c.errors[:name].should == ["can't be blank"]
  end

  it "should return errors if badge image not specified" do
    c = Category.create :name => "Foo"
    c.errors[:badge_image].should == ["can't be blank"]
  end

  it "should return errors if category is already present" do
  	Category.create :name => 'Foo', :badge_image => File.open("#{Rails.root}/db/icon_badge.gif")
    c = Category.create :name => "Foo"
    c.errors[:name].should == ["is already taken"]
  end

end