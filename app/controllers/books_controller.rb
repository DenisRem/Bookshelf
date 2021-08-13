# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!, :set_book, except: %i[index new create]

  def index
    @ransack = Book.ransack(params[:q])
    @books = @ransack.result.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(permitted_attributes)

    if @book.save
      flash[:success] = "Your book \"#{@book.title}\" - created"
      redirect_to @book
    else
      flash.now[:warning] = 'Invalid book parameters!'
      render :new
    end
  end

  def update
    ActiveRecord::Base.transaction do
      @book.update!(permitted_attributes)
      AuthorManager.call(@book, params[:book][:author_ids])
    end
    flash[:success] = "Book profile \"#{@book.title}\"  updated"
    redirect_to @book
  rescue StandardError
    render 'edit', warning: 'Invalid parameters for editing'
  end

  def destroy
    @book.destroy
    flash[:danger] = "Book profile \"#{@book.title}\" has been deleted"
    redirect_to action: :index
  end

  private

  def set_book
    @book = Book.find(params[:id])
    authorize @book
  end
end
