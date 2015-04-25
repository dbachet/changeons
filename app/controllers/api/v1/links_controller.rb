module Api
  module V1
    class LinksController < ApplicationController

      def index
        links = Link.all
        render json: links, each_serializer: LinkSerializer
      end
    end
  end
end
