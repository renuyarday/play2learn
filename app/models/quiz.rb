class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title,   :type => String
  belongs_to :category
  has_many :questions
  
  validates_presence_of :title, :category
end