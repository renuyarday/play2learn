class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  field :question_text,         :type => String
  field :answers,               :type => Hash
  field :correct_answer_index,  :type => Symbol
  field :hint,                  :type => String
  
  belongs_to :book
  belongs_to :quiz
  
  #validates_presence_of :question_text, :correct_answer_index, :hint, :quiz
  
  #validates_each :answers do |r, a, v|
  #  r.errors.add a, "A question must have at least one answer" if (v.nil? || v.empty? || validate_answers?(v))
  #end

  #def validate_answers? (answers)
  #  result = true
  #  answers.each_value do |v|
  #    result = false if !v.has_key?(:text) || !v[:text].blank?
  #    result = false if !v.has_key?(:comment) || !v[:comment].blank?
  #  end
  #  result
  #end
end