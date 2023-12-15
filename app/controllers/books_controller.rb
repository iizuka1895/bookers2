class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end
  
  def index
    @books = Book.all
    @user = current_user
    @book = Book.save(books_params)
  end
  
  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @user = current_user
    if @books.save
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(current_user)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @books = Book.find(params[:id])
    @user = current_user
  end
  
  def update
    @books = Book.find(params[:id])
    @books.update(books_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@books.id)
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
