class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :question_text,           :type => String
  field :correct_answer_hint,     :type => String
  field :incorrect_answer_hint,   :type => String
  
  has_many :answers
  belongs_to :book
  belongs_to :quiz
  
  validates_presence_of :question_text, :correct_answer_hint, :incorrect_answer_hint
  validates_associated :quiz 
  
end