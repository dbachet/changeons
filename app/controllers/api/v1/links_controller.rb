module Api
  module V1
    class LinksController < ApplicationController

      def index
        links = Link.all
        category = Category.where(name: params[:category]).first

        if category.present?
          links = links.where(category: category)
        end

        # binding.pry
        render json: links, each_serializer: LinkSerializer
      end
    end
  end
end
