class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
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
    @books = Book.all
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @user = current_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[ :notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end


