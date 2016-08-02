class Answer < ApplicationRecord
  after_create :notify_user
  after_create :mark_score_for_answer
  
  acts_as_votable
  
  belongs_to :user
  belongs_to :question

  has_many :comments, as: :commentable, dependent: :destroy
  
  has_one :score, as: :scorable, dependent: :destroy
  has_one :acceptation, dependent: :destroy

  def accepted_by(user)
    unaccepted_by(user)
    
    @acceptation = Acceptation.new(question_id: question.id, answer_id: id)
    @acceptation.save

    @score = Score.new(user_id: user.id, scorable_type: @acceptation.class.name, scorable_id: @acceptation.id)
    @score.save
    
    return self
  end

  def unaccepted_by(user)
    @acceptation.destroy if (@acceptation = Acceptation.find_by(question_id: question.id)).present?
    
    return self
  end

  private
    def notify_user
      UserMailer.answer_notification(self, ) if Rails.env.production?
    end

    def mark_score_for_answer
      @score = Score.new(user_id: user_id, scorable_type: self.class.name, scorable_id: id)
      @score.save
    end
end
