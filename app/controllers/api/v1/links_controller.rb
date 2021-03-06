module Api
  module V1
    class LinksController < ApplicationController

      def index

        page = (params[:page] || 1).to_i
        links = Link.order(id: :desc)
        category = Category.where(name: params[:category]).first

        if category.present?
          links = links.where(category: category)
        end

        links = links.page(page).per(10)

        render json: links, each_serializer: LinkSerializer, meta: {total_pages: links.total_pages}
      end
    end
  end
end
