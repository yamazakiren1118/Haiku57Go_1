class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @favorite.haiku_id = params[:haiku_id]
    @favorite.user_id = carrent_user.id
    @haiku = Haiku.find_by(id: params[:haiku_id])
    if @favorite.save
      flash.now[:info] = 'いいねしました'
      # render template: 'pages/index'
      # redirect_to pages_path
    else
      flash[:danger] = 'いいねできませんでした'
      redirect_to pages_path
    end
    # binding.pry
  end

  def destroy
    @favorite = Favorite.find_by(haiku_id: params[:haiku_id],user_id: carrent_user.id)
    @haiku = Haiku.find_by(id: params[:haiku_id])
    if @favorite.delete
      flash[:info] = 'いいねを削除しました'
      # redirect_to pages_path
    else
      flash[:danger] = 'いいねを削除できませんでした'
      # redirect_to pages_path
    end
    # binding.pry
  end
end
