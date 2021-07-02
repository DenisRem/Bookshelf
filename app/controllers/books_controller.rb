# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.page params[:page]
  end

  def new
    @book = Book.new
  end

  def show; end

  def edit; end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = "Your book \"#{@book.title}\" - created"
      redirect_to @book
    else
      flash.now[:warning] = 'Invalid book parameters!'
      render :new
    end
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Book profile \"#{@book.title}\"  updated"
      redirect_to @book
    else
      render 'edit', warning: 'Invalid parameters for editing'
    end
  end

  def destroy
    @book.destroy
    flash[:danger] = "Book profile \"#{@book.title}\" has been deleted"
    redirect_to action: :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :publishing_house, :language,
                                 :year_of_publication, :number_of_pages,
                                 :format, :binbing, :ISBN, :avatar, :availability)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
