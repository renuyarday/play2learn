class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :question_text,         :type => String
  field :answers,           :type => Array, :default => []
  field :correct_answer_index, :type => Integer
  field :hint,              :type => String
  field :book,              :type => Book
  
  belongs_to :quiz
  
  validates_presence_of :question_text, :correct_answer_index, :hint, :quiz
  
end