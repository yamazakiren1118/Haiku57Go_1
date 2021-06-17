class ChatsController < ApplicationController
  def show
    @chat = ChatComment.new
    # @chats = ChatComment.all
    @chats = Chat.find(params[:id]).chat_comments
    @chat_p = Chat.find(params[:id])
    # ActionCable.server.broadcast("chat_channel",data:'aaa')
  end

  def index
    @chats = Chat.all.order("id DESC").page(params[:page]).per(4)
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      flash[:info] = '投稿しました'
      redirect_to chats_path
    else
      flash[:danger] = '投稿に失敗しました'
      render :new
    end
  end
end

private
def chat_params
  params.require(:chat).permit(:chat1,:chat2,:chat3,:user_id)
end