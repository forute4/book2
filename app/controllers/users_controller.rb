class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    
  end

  def edit
    @user = User.find(params[:id])
    @books =Book.all
  end
  
  def index
    @books=Book.all
  end
  
  
end
