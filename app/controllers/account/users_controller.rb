# frozen_string_literal: true

module Account
  class UsersController < Account::AccountController
    before_action :find_user, only: %i[show edit update destroy]

    def show; end

    def edit
      @user = current_user
    end

    def update
      if @user.update(user_params)
        flash[:success] = "User profile \"#{@user.decorate.full_name}\"  updated"
        redirect_to [:account, @user]
      else
        flash.now[:warning] = 'Invalid parameters for editing!'
        render :edit
      end
    end

    def index
      authorize :user
      @users = User.page params[:page]
    end

    def destroy
      authorize @user
      @user.destroy
      flash[:danger] = 'User profile has been deleted'
      redirect_to %i[account users]
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :avatar, :role, :password)
    end

    def find_user
      @user = User.find(params[:id])
    end
  end
end
