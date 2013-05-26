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
      request = PostageApp::Request.new(:send_message, {
        'headers' => {
          'subject'  => t('.welcome_with_password.subject')
        },
        'recipients'  => {
          @user.email => {
            hello: t('.welcome_with_password.hello', name: @user.name),
            we_created_account: t('.welcome_with_password.we_created_account'),
            here_is_your_info: t('.welcome_with_password.here_is_your_info'),
            login_email: t('.welcome_with_password.login_email'),
            user_email: @user.email,
            password: t('.welcome_with_password.password'),
            user_password: user_params[:password],
            change_password: t('.welcome_with_password.change_password'),
            you_can_login: t('.welcome_with_password.you_can_login'),
            greetings: t('.welcome_with_password.greetings')
          }
        },
        'template' => 'welcome-with-password'
      })
      response = request.send
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