class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def create
    user = User.new(user_params)
    user.save
    render json: user
  end

  def new
    user = User.new
    render json: user
  end

  def show
    render json: user
  end

  def destroy
    user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :description, :image_url)
  end

  def find_user
    user = User.find(params[:id])
  end

end
