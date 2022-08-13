class BooksController < ApplicationController
  before_action :correct, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created a new book successfully."
      redirect_to books_path
    else
      flash[:alret] = "You have failed to create a book."
      @books = Book.all
      render "index"
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Your book was successfully updated."
      redirect_to user_path(current_user)
    else
      flash[:alret] = "You failed to update book."
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to  books_path, notice: "Book was successfully deleted."
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
#   ①@book = Book.find(params[:id])でidのついた本を１つ選びます。
# 　②@user = @book.userで①で選んだ本をもってるUserであると定義（Userモデルと関連付けています）
# 　③redirect_to(books_path) unless @user == current_user ②で定義したuserと現在ログインしているuserが一致していなければ、一覧ページにリダイレクトされます。
end
