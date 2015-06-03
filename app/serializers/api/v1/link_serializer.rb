module Api
  module V1
    class LinkSerializer < ShareSerializer
      attributes :id, :name, :url, :created_at, :language, :category, :category_color, :user
    end
  end
end

