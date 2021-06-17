class ChatCommentsController < ApplicationController
  def create
    @chat = ChatComment.new(chat_params)
    
    if @chat.save
      flash[:info] = '投稿しました'
      # redirect_to chats_path
    else
      flash[:danger] = '投稿に失敗しました'
      render :new
    end
  end
end

private
def chat_params
  params.require(:chat_comment).permit(:chat1,:chat2,:chat3,:user_id,:chat_id)
end