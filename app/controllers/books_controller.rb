class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end
  
  def index
    @books = Book.all
    @user = current_user
  end
  
  def create
     @books = Book.new(books_params)
     @books.user_id = current_user.id
     @books.save
     redirect_to user_path(current_user)
  end
  
  def show
    @books = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @books = Book.find(params[:id])
  end
  
  def update
    @books = Book.find(params[:id])
    @books.update
    redirect_to book_path(@book.id)
  end
  
  def destroy
    @books = Book.find(params[:id])
    @books.destroy 
    redirect_to books_path
  end
  
  
  
  private
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
