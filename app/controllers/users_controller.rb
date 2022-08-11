class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_index_path, notice: "Welcome! You have signed up successfully."
  end

  def index
    @users = User.all
    @user = current_user

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to books_path, notice: "Your profile was successfully updated."
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
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
end
