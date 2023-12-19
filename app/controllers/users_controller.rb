class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book= Book.new

  end

  def edit
    @user = User.find(params[:id])
    @books =Book.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.introduction= "aa"
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

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end