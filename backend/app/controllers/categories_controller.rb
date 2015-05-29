class CategoriesController < ApplicationController
  before_action :allow_cross_domain

  def index
    categories = Category.order(name: :ASC)
    render json: categories
  end

  private
  def allow_cross_domain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  end
end
