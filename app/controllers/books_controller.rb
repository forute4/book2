class BooksController < ApplicationController
  def new
    @book= Book.new
  end

  def create
    @book = Book.new (book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user)
  end

  def index
    @book= Book.new
    @books=Book.all
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :image, :caption)
  end
  

end
