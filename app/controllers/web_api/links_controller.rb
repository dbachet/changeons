class WebApi::LinksController < ApplicationController

  def index
    @links = Link.limit(15)
    @links = @links.where(category_id: params[:category]) if params[:category].present?
    render json: @links, each_serializer: LinkSerializer
  end
end