class WebApi::UsersController < ApplicationController

  def index
    @users = User.limit(15)
    render json: @users, each_serializer: UserSerializer
  end

  def current
    render json: current_user, serializer: UserSerializer, root: 'user'
  end
end