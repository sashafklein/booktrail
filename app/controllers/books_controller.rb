class BooksController < ApplicationController
  before_action :load_user, only: :index
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @books = @user.books.order(ended: :desc, started: :desc).all
  end

  def show
  end

  def new
    @book = @user.books.new
  end

  def edit
  end

  def create
    @book = @user.books.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def load_user
    @user = User.find( params[:user_id] )
  end

  def set_book
    @book = Book.find(params[:id])
    if @book.user == current_user
      @user = current_user
    else
      redirect_to root_path, error: "That's not your book!"
    end
  end

  def book_params
    params.require(:book).permit(:name, :author, :started, :ended, :rating, :summary, :thoughts, :user_id)
  end
end
