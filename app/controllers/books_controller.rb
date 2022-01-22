class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end


  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[ :notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end

