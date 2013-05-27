require 'postageapp/mailer'

class UserMailer < PostageApp::Mailer
  default from: 'Changeons.Org <admin@changeons.org>'

  def welcome_with_password(user, password)
    postageapp_template 'welcome-with-password'

    postageapp_variables hello: t('.hello', name: user.name),
                         we_created_account: t('.we_created_account'),
                         here_is_your_info: t('.here_is_your_info'),
                         login_email: t('.login_email'),
                         user_email: user.email,
                         password: t('.password'),
                         user_password: password,
                         change_password: t('.change_password'),
                         you_can_login: t('.you_can_login'),
                         greetings: t('.greetings')

    mail(to: user.email)
  end

  def welcome(user)
    postageapp_template 'welcome'

    postageapp_variables hello: t('.hello', name: user.name),
                         account_created_successfully: t('.account_created_successfully'),
                         you_can_login: t('.you_can_login'),
                         greetings: t('.greetings')

    mail(to: user.email)
  end
end
