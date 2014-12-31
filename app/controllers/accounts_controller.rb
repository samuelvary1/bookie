class AccountsController < ApplicationController
  # load_and_authorize_resource
  # is it a good idea to use this CanCan method to replace the CRUD methods
  # below?

  def index
    @accounts = Account.all
  end

  def create
    @account = Account.new(params[:account])
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    if @account.update_attributes(params[:account])
      flash[:notice] = "Successfully updated account"
      redirect_to account_path(@account)
    else 
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end
end
