class LinkSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :url, :category_id

  embed :ids, include: true
  has_one :category
end
