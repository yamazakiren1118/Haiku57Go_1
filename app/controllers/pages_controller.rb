class PagesController < ApplicationController
  def index
    
    @haikus = Haiku.all.order("id DESC").page(params[:page]).per(4)
    # binding.pry
  end
end
