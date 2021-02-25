class UsersController < ApplicationController
  #ビフォーアクション　URL params[:id]で取得可能を取得してsessionと参照する
  before_action :check_login, only: [:show]
  def new
    # binding.pry
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      flash[:now] = "成功しました"
      redirect_to user_url(@user)
      # redirect_to user_path_path(id: @user.id)
      # redirect_to "/users/#{@user.id}"
    else
      flash[:danger] = "失敗しました"
      # binding.pry
      redirect_to new_user_path
    end
  end
  def show
    #カレントユーザーにする
    # @haiku = carrent_user.haikus
    @haikus = carrent_user.haikus.page(params[:page]).per(4)
  end
  def destroy
    User.destroy(session[:user_id])
    session[:user_id] = nil
    redirect_to new_user_path
  end
end

private
def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end

def check_login
  if carrent_user == nil
    redirect_to sessions_new_path
  else
    if params[:id].to_i != carrent_user.id
        render template: 'errors/400'
        # redirect_to '/400'
        # render '/400'
    else
        nil
    end
  end
end