class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
  end

  def edit
    @user = User.find(params[:id])
    @books =Book.all
  end
  
  def update
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
    @users= User.all
  end

end