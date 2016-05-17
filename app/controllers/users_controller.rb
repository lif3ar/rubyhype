class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
  end

  def update
    @user = User.update(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :avatar)
    end

end