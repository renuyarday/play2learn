class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :question_text, :type => String
  validates_presence_of :question_text
  validates_uniqueness_of :question_text, :scope => :quiz_id, :case_sensitive => false, :message => "Another with this question is already created"
  
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
  validate :validate_answers

  belongs_to :book
  belongs_to :quiz
  
  validates_associated :quiz
  validates_associated :answers

  
  def display_name
    "#{ question_text }"
  end
    
  private
  
    def validate_answers
      errors[:question_text] << "Atleast two answers are required" if @answers.length < 2
      errors[:question_text] << "One answer must be selected as the correct answers" if !correct_answer_set?
      errors[:question_text] << "Two or more answer texts are matching" if unique_answer?
    end

    def correct_answer_set?
      @answers.select { |answer| answer.is_correct }.length == 1
    end
    
    def unique_answer?
      flag = false
      ans_array =Array.new
      @answers.each do |ans|
        ans_array.push(ans.answer_text)
      end
      ans_array.each do |i|
        answer = ans_array.pop
          ans_array.each do |j|
            if answer.downcase.eql? j.downcase
              flag = true
            end
          end
       end
       return flag
    end
    
    def question_must_be_unique
      puts "Quiz was: #{self.quiz.title}"
      errors[:question_text] << "is already added" if quiz_contains_question? 
    end 
    
    def quiz_contains_question?
      self.quiz.questions.where(:quiz => self.quiz, :question_text => Regexp.compile(self.question_text, Regexp::IGNORECASE)).exists?
    end
end











