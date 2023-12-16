class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(current_user)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = current_user
  end
  
  def edit
    @books = Book.find(params[:id])
    @user = current_user
  end
  
  def update
    @book = Book.find(params[:id])
    @user = current_user
   if  @book.update(books_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@books.id)
   else
       render :show
   end
  end
  
  def destroy
    @books = Book.find(params[:id])
    @books.destroy 
    redirect_to books_path
  end
  
  
  
  private
  
  def books_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
