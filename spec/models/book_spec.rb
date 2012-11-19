require "spec_helper"

describe Book do

  describe "should validate to ensure that" do
    before { @book = Book.create }

    it "title was specified" do
      @book.errors[:title].should == ["can't be blank"]
    end

    it "link was specified" do
      @book.errors[:link].should == ["can't be blank"]
    end

    it "cover image was specified" do
      @book.errors[:cover_image].should == ["can't be blank"]
    end

    it "book associated with at least one category" do
      @book.errors[:categories].should == ["At least one category must be selected"]
    end

    it "author was specified" do
      @book.errors[:author].should == ["can't be blank"]
    end
  end

end