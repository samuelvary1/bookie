class AccountsController < ApplicationController
  load_and_authorize_resource

  def index
    @accounts = Account.all
  end

  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
