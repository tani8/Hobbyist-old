class HobbiesController < ApplicationController
  before_action :find_hobby, only: [:edit, :update, :destroy]

  def index
    hobbies = Hobby.select('hobbies.name')
                    .order('hobbies.name asc')
    render json: hobbies.to_json
  end

  def create
    hobby = Hobby.new(hobby_params)
    hobby.save
    render json: hobby.to_json
  end

  def new
    hobby = Hobby.new
    render json: hobby.to_json
  end

  def edit
    render json: hobby.to_json
  end

  def update
    hobby.update_attributes(hobby_params)
    render json: hobby.to_json
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

end
