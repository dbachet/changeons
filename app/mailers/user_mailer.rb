class UserMailer < ActionMailer::Base
  default from: 'admin@changeons.org'

  def welcome_with_password(user, password)
    @password = password
    @user = user
    mail(to: user.email, subject: t('.subject')).deliver
  end

  def welcome(user)
    @user = user
    mail(to: user.email, subject: t('.subject')).deliver
  end
end
