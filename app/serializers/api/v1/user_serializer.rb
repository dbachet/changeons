module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :created_at
    end
  end
end

