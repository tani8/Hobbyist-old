class HobbiesController < ApplicationController
  before_action :find_hobby, only: [:edit, :update, :destroy]
  before_action :restrict_access, except: [:index, :show]

  def index
    hobbies = Hobby.select('hobbies.name')
                    .order('hobbies.name asc')
    render json: hobbies
  end

  def create
    hobby = Hobby.new(hobby_params)
    hobby.category_id = params[:category_id]
    hobby.save
    render json: hobby
  end

  def new
    hobby = Hobby.new
    render json: hobby
  end

  def edit
    render json: hobby
  end

  def show
  end

  def update
    hobby.update_attributes(hobby_params)
    render json: hobby
  end

  def destroy
    hobby.destroy
  end

  private
  def hobby_params
    params.require(:hobby).permit(:name, :description, :image_url)
  end

  def find_hobby
    hobby = Hobby.find(params[:id])
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
