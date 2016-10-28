module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json

      def show
        @user = User.find(params[:id])
        render json: @user, serializer: UserSerializer
      end
    end
  end
end
