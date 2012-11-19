class Quiz
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title,   :type => String
  field :description, :type => String
  field :time, :type => Hash, :default => { :hours => 0, :minutes => 0 }

  belongs_to :category
  has_many :questions
  
  validates_presence_of :title, :category, :description, :time
end