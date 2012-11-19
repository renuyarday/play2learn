class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :answer_text,  :type => String
  field :is_correct,   :type => Boolean
  
  belongs_to :question
   
  validates_presence_of :answer_text, :is_correct
 # validates_associated :question 
  
end