class LinkSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :url, :category_id, :user_id

  embed :ids, include: true
  has_one :category
  has_one :user
end
