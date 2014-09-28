class CategorySerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :color

  embed :ids, include: true
end
