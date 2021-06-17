class PagesController < ApplicationController
  def index
    
    @haikus = Haiku.all.order("id DESC").page(params[:page]).per(4)
    
    # binding.pry
    
  end
  def sort
    @sort_haikus = Haiku.all.sort{|a,b| a.favorites.length <=> b.favorites.length}.reverse
    @haikus = Kaminari.paginate_array(@sort_haikus).page(params[:page]).per(4)
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
