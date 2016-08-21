class Question < ApplicationRecord
  after_create :notify_slack
  
  acts_as_votable
  acts_as_taggable_on :tags
    
  belongs_to :user
  
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one :acceptation
  
  def favorited_by(user)
    @favorite = Favorite.new(user_id: user.id, question_id: id)
    @favorite.save

    return self
  end

  def unfavorited_by(user)
    @favorite = Favorite.find_by(user_id: user.id, question_id: id)
    @favorite.destroy

    return self
  end

  def is_favorited_by(user)
    @favorite = Favorite.find_by(user_id: user.id, question_id: id) unless user.nil?
    !@favorite.nil?
  end

  def notify_slack
    uri = URI.parse(ENV['slack_url'])
    
    slack_params = {
        text: "#{title} by *#{user.name}* <http://unlock-n-ror.herokuapp.com/questions/#{id}|Click Here>",
        channel: "#bot-test",
        username: "unlock-n-ror"
    }.to_json
   
    Net::HTTP.post_form uri, {"payload" => slack_params}
  end
end
