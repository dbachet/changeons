class CategorySerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :color
end
