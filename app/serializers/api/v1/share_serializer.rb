module Api
  module V1
    class ShareSerializer < ActiveModel::Serializer
      attributes :id, :type, :name, :url, :created_at, :language, :category, :category_color, :user, :remote_id

      def category
        object.category.name if object.type == "Link"
      end

      def category_color
        object.category.color if object.type == "Link"
      end

      def type
        object.type
      end

      def user
        object.user.name if object.type == "Link"
      end

      def remote_id
        object.remote_id.to_s if object.type == "Tweet"
      end
    end
  end
end
