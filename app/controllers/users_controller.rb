class UsersController < ApplicationController
  def new
    flash[:notice] = "Welcome! You have signed up successfully."
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
