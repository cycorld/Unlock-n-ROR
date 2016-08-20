class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # process data sent from the page
    puts "123"
    current_user.messages.create!(content: data['message'], chatroom_id: data['chatroom_id'])
  end
end
