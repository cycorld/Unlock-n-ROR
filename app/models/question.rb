class Question < ApplicationRecord 
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
end
