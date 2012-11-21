class Answer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :answer_text,  :type => String
  field :is_correct,   :type => Boolean, :default => false
  field :hint,         :type => String
  validates_uniqueness_of :answer_text, :scope => :question_id, :case_sensitive => false, :message => "has already been added!"
  
  belongs_to :question
   
  validates_presence_of :answer_text, :hint
  validates_associated :question
  
end