class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_with_password(@user, user_params[:password]).deliver
      redirect_to users_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params_for_update)
      redirect_to users_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, {role_ids: []}, :password, :password_confirmation)
  end

  def user_params_for_update
    params.require(:user).permit({role_ids: []})
  end
end