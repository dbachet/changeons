class WebApi::CategoriesController < ApplicationController

  def index
    @categories = Category.limit(15)
    render json: @categories, each_serializer: CategorySerializer
  end
end