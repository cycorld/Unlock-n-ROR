class Answer < ApplicationRecord
  acts_as_votable
  
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
end
