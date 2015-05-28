class CategoriesController < ApplicationController
  def index
    categories = Category.select('categories.name')
                          .order('categories.name desc')
    render json: categories.to_json
  end
end
