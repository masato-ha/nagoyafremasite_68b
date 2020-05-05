class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    
  end

  # def create
  #   User.create(params[:user])
  #   binding.pry
  #   redirect_to root_path
  # end
   
  def show
    @user = User.find(params[:id])
  end

  
  





end
