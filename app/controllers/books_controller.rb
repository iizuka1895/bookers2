class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
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
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def update
    @book = Book.find(params[:id])
    @user = current_user
   if  @book.update(books_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
   else
       render :edit
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
  
  def is_matching_login_user
    @user = User.find(current_user.id)
    unless @user.id == Book.find(params[:id]).user_id
      redirect_to books_path
    end
  end
end
