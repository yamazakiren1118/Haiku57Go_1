class SchoolsController < ApplicationController
  def index
    @schools = School.all.order("id DESC").page(params[:page]).per(2)
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
      binding.pry
      render :new
      
    end
  end

  def drete
  end

  def edit
    @school = School.find(params[:id])
    binding.pry
  end

  def update
    @school = School.find(params[:id])
    @school.update(permit: params[:permit])
  end

  def search
    @schools = School.where("name LIKE ?","%#{params[:school]}%").or(School.where("address LIKE ?","%#{params[:school]}%")).or(School.where("email LIKE ?","%#{params[:school]}%")).or(School.where("haiku1 LIKE ?","%#{params[:school]}%")).or(School.where("haiku2 LIKE ?","%#{params[:school]}%")).or(School.where("haiku3 LIKE ?","%#{params[:school]}%"))
  end

  private
  def school_params
    params.require(:school).permit(:name,:email,:address,:permit,:haiku1,:haiku2,:haiku3,:user_id)
  end
end
