class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = Book.find(params[:id]).user
    @book = Book.find(params[:id])
    @newBook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  def create
    @book = current_user.books.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end


  # def get_edit_route(x)
  #   if x == current_user.id
  #     edit_user_path(current_user.id)
  #   else
  #     user_path(current_user.id)
  #   end
  # end


  private

    def book_params
      params.require(:book).permit(:title,:body)
    end

end
