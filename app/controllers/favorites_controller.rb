class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.haiku_id = params[:haiku_id]
    @favorite.user_id = carrent_user.id
    if @favorite.save
      flash[:now] = 'いいねしました'
      redirect_to pages_path
    else
      flash[:danger] = 'いいねできませんでした'
      redirect_to pages_path
    end
    binding.pry
  end

  def destroy
    @favorite = Favorite.find_by(haiku_id: params[:haiku_id],user_id: carrent_user.id)
    if @favorite.delete
      flash[:now] = 'いいねを削除しました'
      redirect_to pages_path
    else
      flash[:danger] = 'いいねを削除できませんでした'
      redirect_to pages_path
    end
    binding.pry
  end
end
