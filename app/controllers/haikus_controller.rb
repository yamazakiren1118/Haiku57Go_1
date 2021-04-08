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
      flash[:info] = '投稿しました'
      redirect_to new_haiku_path
    else
      flash[:danger] = '投稿に失敗しました'
      redirect_to new_haiku_path
    end
  end
  def destroy
    # binding.pry
    flash[:danger] = '投稿を削除しました'
    Haiku.destroy(params[:id])
    # redirect_to root_path
  end
  def show
    @haiku = Haiku.find(params[:haiku_id])
    @comment = Haiku.find(params[:haiku_id]).comments
  end
  def edit
    @haiku = Haiku.find(params[:haiku_id])
    @user = @haiku.user
  end
  def update
    # binding.pry
    @haiku = Haiku.find(params[:haiku][:haiku_id])
    if @haiku.update(haiku_params)
      flash[:info] = '編集しました'
      redirect_to root_path
    else
      flash[:danger] = '編集に失敗しました'
      redirect_to new_haiku_path
    end
  end
  def search
    # @haikus = Haiku.where("haiku1 LIKE ?","%#{params[:haiku]}%").where("haiku2 LIKE ?","%#{params[:haiku]}%").where("haiku3 LIKE ?","%#{params[:haiku]}%").page(params[:page]).per(4)
    @haikus = Haiku.where("haiku1 LIKE ?","%#{params[:haiku]}%").or(Haiku.where("haiku2 LIKE ?","%#{params[:haiku]}%")).or(Haiku.where("haiku3 LIKE ?","%#{params[:haiku]}%")).page(params[:page]).per(4)
    
    binding.pry
    
  end
  def favorite_haiku
    @haikus = Haiku.all.sort{|a,b| a.favorites.length <=> b.favorites.length}.reverse
    @haiku = Kaminari.paginate_array(@haikus).page(params[:page]).per(4)
    # @haiku = Haiku.all.page(params[:page]).per(4)
    # render template: "pages/index"
    # binding.pry
  end
end

private
def haiku_params
  params.require(:haiku).permit(:haiku1,:haiku2,:haiku3,:user_id)
end
