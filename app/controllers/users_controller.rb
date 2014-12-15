class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @edit = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
