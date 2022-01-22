class UsersController < ApplicationController
  def new
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
