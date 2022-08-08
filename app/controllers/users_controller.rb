class UsersController < ApplicationController
  def new
  end

  def create
    @user = @User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_index_path
  end

  def index
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
