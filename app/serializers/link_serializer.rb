class LinkSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :url
end
