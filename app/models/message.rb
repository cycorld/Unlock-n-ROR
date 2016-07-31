class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_later(self) }
  
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
