class HaikusController < ApplicationController
  def index
  end
  def new
    @haiku = Haiku.new
  end
  def create
    @haiku = Haiku.new(haiku_params)
    # binding.pry
    if @haiku.save
      flash[:now] = '投稿しました'
      redirect_to new_haiku_path
    else
      flash[:danger] = '投稿に失敗しました'
      redirect_to new_haiku_path
    end
  end
  def destroy
    binding.pry
    flash[:danger] = '投稿を削除しました'
    Haiku.destroy(params[:id])
    redirect_to root_path
  end
end

private
def haiku_params
  params.require(:haiku).permit(:haiku1,:haiku2,:haiku3,:user_id)
end
