require "spec_helper"

describe Book do
  
  before :each do
    Book.delete_all
    @book = FactoryGirl.build :book
  end

  describe "should have the structure" do
  
    subject { @book }
  
    it { should respond_to(:title) }
    it { should respond_to(:link) }
    it { should respond_to(:cover_image) }
    it { should respond_to(:categories) }
    it { should respond_to(:author) }
  end

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

  it "should be marked deleted when delete is performed" do
    refresh_categories

    @book.categories = [Category.first]
    @book.cover_image = File.open("#{Rails.root}/db/icon_badge.gif")
    @book.save!
    Book.all.count.should == 1

    @book.delete
    Book.all.count.should == 0
    
    Book.where(:deleted_at.exists => true, :title => 'Foo').count.should == 1
  end

end