class Acceptation < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  has_one :score, as: :scorable, dependent: :destroy
end
