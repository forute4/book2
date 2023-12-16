class BooksController < ApplicationController
  def new
    @book= Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="Book was successfully create"
      redirect_to book_path(@book.id)
    else
      flash[:alert] ="Book was error create "
    end
  end

  def index
    @user = current_user
    @books=Book.all
    @book=Book.new
    
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
    if @book.save
      flash[:notice] ="Book was successfully updated"
      redirect_to book_path(@book.id)
    else
      flash[:alert] ="Book was error updated "
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
