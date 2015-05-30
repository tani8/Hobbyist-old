class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def create
    # ############## Imgur #################
    # require 'imgur'
    # client = Imgur.new(# api key here)
    # img_path = params[:image][:tempfile].path # image is name for file input html
    # img = Imgur::LocalImage.new(img_path)
    # img_url = imgurClient.upload(img).link
    # ######################################
    user = User.new(user_params)
    user.save
    render json: user
  end

  def new
    user = User.new
    render json: user
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image_url)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
