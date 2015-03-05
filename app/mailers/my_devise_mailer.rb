# class MyDeviseMailer < PostageApp::Mailer
#   include Devise::Mailers::Helpers

#   def reset_password_instructions(record, opts={})
#     postageapp_template 'reset-password-instructions'
#     postageapp_variables  hello: t('.hello', name: record.name ||= record.email),
#                           someone_requested_password_reset: t('.someone_requested_password_reset'),
#                           change_my_password: t('.change_my_password'),
#                           ignore_email: t('.ignore_email'),
#                           your_password_wont_change: t('.your_password_wont_change'),
#                           greetings: t('.greetings'),
#                           change_my_password: t('.change_my_password'),
#                           link_url: edit_user_password_url(record, :reset_password_token => record.reset_password_token)

#     devise_mail(record, :reset_password_instructions, opts)
#   end
# end