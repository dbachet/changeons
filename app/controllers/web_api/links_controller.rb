class WebApi::LinksController < ApplicationController

  def index
    @links = Link.limit(15)
    @links = @links.where(category_id: params[:category]) if params[:category].present?
    render json: @links, each_serializer: LinkSerializer
  end

  def create
    @link = Link.new(create_params)

    if @link.save
      render json: @link
    else
      render json: { errors: @link.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:link).permit(:name, :url, :category, :language)
  end
end