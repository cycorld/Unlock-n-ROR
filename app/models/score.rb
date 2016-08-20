class Score < ApplicationRecord
  belongs_to :user
  belongs_to :scorable, polymorphic: true
end
