class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book= Book.new

  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
    @books =Book.all
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
  if @user.save
    flash[:notice] ="User was successfully updated"
    redirect_to user_path(@user.id)
  else
    flash[:alert] ="User was error updated "
    render :edit
  end
  end

  def index
    @user = current_user
    @users= User.all
    @book=Book.new
  end

end