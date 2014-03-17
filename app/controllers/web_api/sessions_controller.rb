class WebApi::SessionsController < ApplicationController

  def create
    user = current_user || User.find_for_database_authentication(email: create_params[:email])
    if user.present? && user.valid_password?(create_params[:password])
      sign_in user unless current_user
      render json: user, serializer: UserSerializer, root: 'session', status: :created
    else
      render json: { errors: { email: ['Email or password is incorrect'] } }, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:session).permit :email, :password
  end

end