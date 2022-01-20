class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
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
