class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :question_text,           :type => String
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  validate :validate_answers

  belongs_to :book
  belongs_to :quiz
  
  validates_presence_of :question_text
  validates_associated :quiz
  validates_associated :answers

  private
  
    def validate_answers
      errors[:question_text] << "Atleast two answers are required" if @answers.length < 2
      errors[:question_text] << "One answer must be selected as the correct answers" if !correct_answer_set?  
        
    end

    def correct_answer_set?
      @answers.select { |answer| answer.is_correct == true }.length == 1
    end
  
end