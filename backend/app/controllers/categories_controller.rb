class CategoriesController < ApplicationController
  def index
    categories = Category.order(name: :asc)
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category.as_json(only: [:id, :name])
  end
end
