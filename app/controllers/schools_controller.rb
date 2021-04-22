class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @schools = School.new
  end

  def create
    @schools = School.new(school_params)

    if @schools.save
      flash[:info] = '受け付けました'
      redirect_to root_path
    else
      render :new
    end
  end

  def drete
  end

  def update
    @school = School.find(params[:id])
    @school.update(permit: params[:permit])
  end

  def serch
  end

  private
  def school_params
    params.require(:school).permit(:name,:email,:address,:permit,:haiku1,:haiku2,:haiku3)
  end
end
