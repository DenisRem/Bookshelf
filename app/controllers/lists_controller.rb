# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!, :set_list, except: %i[index new create]

  def index
    @lists = List.page(params[:page])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(permitted_attributes)

    if @list.save
      flash[:success] = "Your list \"#{@list.name}\" - created"
      redirect_to @list
    else
      flash.now[:warning] = 'Invalid list parameters!'
      render :new
    end
  end

  def update
    ActiveRecord::Base.transaction do
      @list.update!(permitted_attributes)
      BookManager.call(@list, params[:list][:book_ids])
    end
    flash[:success] = "List profile \"#{@list.name}\"  updated"
    redirect_to @list
  rescue StandardError
    render 'edit', warning: 'Invalid parameters for editing'
  end

  def destroy
    @list.destroy
    flash[:danger] = "List profile \"#{@list.name}\" has been deleted"
    redirect_to action: :index
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
