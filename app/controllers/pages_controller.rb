class PagesController < ApplicationController
  def index
    
    @haikus = Haiku.page(params[:page]).per(4)
    # binding.pry
  end
end
