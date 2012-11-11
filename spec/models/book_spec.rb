require "spec_helper"

describe "Book" do

  it "should return errors if title was not specified" do
    b = Book.create

    b.errors[:title].should == ["can't be blank"]
  end

  it "should return errors if link was not specified" do
    b = Book.create

    b.errors[:link].should == ["can't be blank"]
  end

  it "should return errors if cover image was not specified" do
    b = Book.create

    b.errors[:cover_image].should == ["can't be blank"]
  end


end