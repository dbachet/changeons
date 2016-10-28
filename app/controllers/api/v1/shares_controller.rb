module Api
  module V1
    class SharesController < ApplicationController
      before_action :authenticate_user!, only: [:create]
      respond_to :json

      def create
        @share = Link.create!(
          name: create_params[:name],
          url: create_params[:url],
          user: User.first,
          category: Category.find_by_name(create_params[:category]),
          language: create_params[:language])
        render json: @share, serializer: ShareSerializer
      end

      def index
        set_page
        set_shares
        set_category

        select_shares_by_category

        paginate_shares

        render json: @shares, each_serializer: ShareSerializer, meta: {total_pages: @shares.total_pages}
      end

      private

      def create_params
        params
          .require(:data)
          .require(:attributes)
          .permit(:name, :url, :language, :category)
      end

      def set_page
        @page ||= (params[:page] || 1).to_i
      end

      def set_shares
        @shares ||= Share.order(created_at: :desc)
      end

      def set_category
        @category ||= Category.where(name: params[:category]).first
      end

      def select_shares_by_category
        if @category.present?
          @shares = @shares.where(category_id: @category.id)
        end
      end

      def paginate_shares
        @shares = @shares.page(@page).per(10)
      end
    end
  end
end
