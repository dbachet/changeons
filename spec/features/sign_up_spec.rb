require 'spec_helper'

feature 'Signing up' do

  scenario 'with name' do
    visit new_user_registration_path
    find('#user_email').set('user@test.com')
    find('#user_name').set('Thomas Magnum')
    find('#user_password').set('testtest')
    find('#user_password_confirmation').set('testtest')
    click_button 'Sign up'
    page.should have_content 'You have signed up successfully'
    User.last.name.should eql 'Thomas Magnum'
  end
end