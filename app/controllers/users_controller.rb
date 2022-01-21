class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = User.find(params[:id]).books #指定したユーザに結びつく本一覧
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

end


private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end