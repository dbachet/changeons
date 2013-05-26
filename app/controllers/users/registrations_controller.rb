class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super

    # TODO: Move this code in a cleaner place !!
    request = PostageApp::Request.new(:send_message, {
      'headers' => {
        'subject'  => t('.welcome.subject')
      },
      'recipients'  => {
        @user.email => {
          hello: t('.welcome.hello', name: @user.name),
          you_can_login: t('.welcome.you_can_login'),
          account_created_successfully: t('.welcome.account_created_successfully'),
          greetings: t('.welcome.greetings')
        }
      },
      'template' => 'welcome'
    })
    response = request.send
  end

end