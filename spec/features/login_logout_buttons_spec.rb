require 'spec_helper'

feature 'Log in/out button' do

  scenario 'When a user is not logged in' do
    visit root_path

    click_link('Login')
    current_path.should == new_user_session_path
  end

  scenario 'When a user is logged in' do
    sign_in
    visit root_path

    click_link('Logout')
    current_path.should == root_path
  end
end