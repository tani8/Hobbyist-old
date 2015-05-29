class CategoriesController < ApplicationController
  def index
    categories = Category.select('categories.name')
                          .order('categories.name asc')
    render json: categories
  end

  def show
    category = Category.find(params[:id])
  end
end
