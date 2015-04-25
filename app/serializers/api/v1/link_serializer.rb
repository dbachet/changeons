module Api
  module V1
    class LinkSerializer < ActiveModel::Serializer
      attributes :id, :name, :url, :created_at, :language, :category, :category_color, :user

      def category
        object.category.name
      end

      def category_color
        object.category.color
      end

      def user
        object.user.name
      end
    end
  end
end

