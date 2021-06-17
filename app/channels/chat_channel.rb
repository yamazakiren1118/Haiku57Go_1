class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from  "chat_channel_#{params[:chat]}"
    puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaa'
    puts params[:chat]
    puts 'ccccccccccccccccccc'
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    puts 'bbbbbbbb'
  end


  def chat_rb(data)

    # data[:user_id] = User.find(data[:user_id].to_i).name
    
    data[:user_id] = User.find(data['user_id'].to_i).name
    
    ActionCable.server.broadcast "chat_channel_#{params[:chat]}",data
    puts 'bbbbbbbbbbbbbaaaaaaaaaaaaaaaaaa'
  end
end
