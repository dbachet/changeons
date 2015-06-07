module Api
  module V1
    class ShareSerializer < ActiveModel::Serializer
      attributes :id, :type, :name, :url, :created_at, :language, :category, :category_color, :user, :remote_id

      def category
        object.category.name if type == "Link"
      end

      def category_color
        object.category.color if type == "Link"
      end

      def user
        object.user.name if type == "Link"
      end

      def remote_id
        object.remote_id.to_s if type == "Tweet"
      end
    end
  end
end