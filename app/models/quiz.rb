class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps

  Published_Status = "Published"
  
  field :title,   :type => String
  field :description, :type => String
  field :status, :type => String, :default => "Draft"

  has_and_belongs_to_many :categories
  
  has_many :questions
  accepts_nested_attributes_for :questions, :allow_destroy => true
  
  validates_presence_of :title, :categories, :description

  def publish
  	raise "Quiz is already published" if published?
  	@status = Published_Status
  	save
  end

  def published?
  	@status == Published_Status
  end
end