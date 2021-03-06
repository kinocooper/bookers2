class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    # @user = Book.find(params[:id]).user
    # @book = Book.find(params[:id])
    # @newBook = Book.new
    @user = Book.find(params[:id]).user
    @book = Book.new
    @thisBook = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path,notice: 'You have deleted book successfully.'
  end


  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
      @user = User.find(current_user.id)
      # @book = Book.new
      @books = Book.all
      render :index
    end
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
