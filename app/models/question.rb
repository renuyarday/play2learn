class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :question_text,         :type => String
  field :answers,               :type => Array
  field :correct_answer_index,  :type => Integer
  field :hint,                  :type => String
  
  belongs_to :book
  belongs_to :quiz
  
  validates_presence_of :question_text, :correct_answer_index, :hint, :quiz
  validates :answers, :presence => { :message => "A question must have at least one answer" }
  
end