class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :question_text,           :type => String
  
  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true

  belongs_to :book
  belongs_to :quiz
  
  validates_presence_of :question_text
  #validate :validate_answers
  validates_associated :quiz

  def validate_answers
    errors.add(:answers, "A question must have at least one answer") if @answers.nil? || @answers.count == 0
    #errors.add(:answers, "One answer must be selected as the correct answers") if @answers.select { |answer| answer.is_correct == true }.empty?
  end
  
end