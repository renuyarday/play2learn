require "spec_helper"

describe Category do
  before :each do
    Category.delete_all
    @category = Category.new :name => 'Foo'
  end

  describe "should have the structure" do
    
    subject { @category }
  
    it { should respond_to(:name) }
    it { should respond_to(:badge_image) }
  end

  describe "should validate to ensure that" do

    it "name is specified" do
      c = Category.create
      c.errors[:name].should == ["can't be blank"]
    end

    it "badge image is specified" do
      c = Category.create :name => "Foo"
      c.errors[:badge_image].should == ["can't be blank"]
    end

    it "name is unique" do
    	Category.create :name => 'Foo', :badge_image => File.open("#{Rails.root}/db/icon_badge.gif")
      c = Category.create :name => "Foo"
      c.errors[:name].should == ["is already taken"]
    end
  end

  it "should be marked deleted when delete is performed" do
    @category.badge_image = File.open("#{Rails.root}/db/icon_badge.gif")
    @category.save!
    Category.all.count.should == 1

    @category.delete
    Category.all.count.should == 0
    
    Category.where(:deleted_at.exists => true, :name => 'Foo').count.should == 1
  end

end