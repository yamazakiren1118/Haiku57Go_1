class PagesController < ApplicationController
  def index
    @haiku = Haiku.all
  end
end
