class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]


  def new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path, notice: "Welcome! You have signed up successfully."
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to user_path
    else
      flash[:alret] = "You failed to update profile."
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = Book.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_index_path, notice: "You have destroied successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    @books = @user.books
    redirect_to user_path(current_user) unless @user == current_user
  end
end
