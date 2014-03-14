class WebApi::LinksController < ApplicationController

  def index
    @links = Link.limit(15)
    render json: @links, each_serializer: LinkSerializer
  end
end