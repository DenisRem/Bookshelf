# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!, :set_author, except: %i[index new create]

  def index
    @authors = Author.page(params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(permitted_attributes)

    if @author.save
      flash[:success] = "Your author \"#{@author.name}\" - created"
      redirect_to @author
    else
      flash.now[:warning] = 'Invalid author parameters!'
      render :new
    end
  end

  def update
    if @author.update(permitted_attributes)
      flash[:success] = "Author profile \"#{@author.name}\"  updated"
      redirect_to @author
    else
      render 'edit', warning: 'Invalid parameters for editing'
    end
  end

  def destroy
    @author.destroy
    flash[:danger] = "Author profile \"#{@author.name}\" has been deleted"
    redirect_to action: :index
  end

  private

  def set_author
    @author = Author.find(params[:id])
    authorize @author
  end
end
