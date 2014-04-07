class CategorySerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :color

  embed :ids, include: true
  has_many :links, serializer: LinkSerializer
end
