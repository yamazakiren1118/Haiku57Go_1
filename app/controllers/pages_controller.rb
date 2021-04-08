class PagesController < ApplicationController
  def index
    
    @haikus = Haiku.all.order("id DESC").page(params[:page]).per(4)
    # binding.pry
  end
  def sort
    @haikus = Haiku.all.sort{|a,b| a.favorites.length <=> b.favorites.length}.reverse
    @sort_haikus = Kaminari.paginate_array(@haikus).page(params[:page]).per(4)
  end
end
