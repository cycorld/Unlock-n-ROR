class Question < ApplicationRecord
  
  acts_as_votable
  acts_as_taggable_on :tags
  
  belongs_to :user
  has_many :answers
end
