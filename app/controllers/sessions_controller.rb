class SessionsController < ApplicationController
  def new
  end
  def create
    post = session_params
    user = User.find_by(email: post[:email])
    # binding.pry
    if user && user.authenticate(post[:password])
      session[:user_id] = user.id
      flash[:now] = 'ログインしました'
      redirect_to user_url(user)
    else
      flash[:danger] = 'ログインに失敗しました'
      redirect_to sessions_new_path
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:danger] = 'ログアウトしました'
    redirect_to sessions_new_path
  end
end
private
def session_params
  params.require(:session).permit(:name,:email,:password,:password_confirmation)
end
