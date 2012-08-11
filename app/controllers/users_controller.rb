class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!" # TODO: Add tests for the flash
      redirect_to @user # TODO: Add tests for correct redirection
    else
      render 'new'
    end
  end

end
