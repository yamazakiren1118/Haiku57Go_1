class UsersController < ApplicationController
  #ビフォーアクション　URL params[:id]で取得可能を取得してsessionと参照する
  before_action :check_login, only: [:show]
  def new

    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      flash[:info] = "成功しました"
      redirect_to user_url(@user)
      # redirect_to user_path_path(id: @user.id)
      # redirect_to "/users/#{@user.id}"
    else
      flash[:danger] = "失敗しました"
      binding.pry
      render :new
    end
  end
  def show
    @haikus = carrent_user.haikus.order("id DESC").page(params[:page]).per(4)
    @favorite_haikus = carrent_user.favorite_haikus.order("id DESC").page(params[:page]).per(4)
    @x = (carrent_user.haikus.length / 4.0).ceil
    @haikus2 = carrent_user.haikus.order("id DESC").limit(4).offset((@x-1) * 4)
    # binding.pry
  end
  def destroy
    User.destroy(session[:user_id])
    session[:user_id] = nil
    redirect_to new_user_path
  end
  def favorite_haiku
    # @favorite_haikus = carrent_user.favorite_haikus.limit(3)
    @favorite_haikus = carrent_user.favorite_haikus.order("id DESC").page(params[:page]).per(4)
    
    binding.pry
  end
  def sort
    @haikus = carrent_user.favorite_haikus.order("id DESC").page(params[:page]).per(4)
  end


  def pagenate
    params[:page] = params[:page].to_i + 1
    @haikus = Haiku.all.order("id DESC").page(params[:page]).per(4)
    # binding.pry
    puts "pagenateaaaaaaa#{params[:page]}"
    respond_to do |format|
      format.js
    end
    puts "ALLOKALLOKALLOKALLOKALLOKALLOK"
  end
end

private
def user_params
  params.require(:user).permit(:name,:email,:password,:password_digest)
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