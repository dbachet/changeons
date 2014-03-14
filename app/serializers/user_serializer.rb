class UserSerializer < ActiveModel::Serializer
  self.root = true

  attributes :id, :name, :email
end