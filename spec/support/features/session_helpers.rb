# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    include Warden::Test::Helpers

    def sign_in
      @current_user ||= User.create(email: 'test@user.com', password: 'secret')
      Warden.test_mode!
      login_as(@current_user, :scope => :user)
    end
  end
end