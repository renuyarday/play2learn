class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :question_text,           :type => String
  
  has_many :answers
  validate :validate_answers

  belongs_to :book
  belongs_to :quiz
  
  validates_presence_of :question_text
  validates_associated :quiz
  validates_associated :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true

  def validate_answers
    errors.add(:answers, "A question must have at least one answer") if self.answers.nil? || self.answers.count == 0
    #errors.add(:answers, "One answer must be selected as the correct answers") if @answers.select { |answer| answer.is_correct == true }.empty?
  end
  
end