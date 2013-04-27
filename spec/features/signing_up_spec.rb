require 'spec_helper'

feature "Signing up" do
  background do
    User.create(email: 'user@example.com', password: 'secretee')
  end

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'secretee'
    end
    click_button 'Sign in'
    page.should have_content 'Signed in successfully'
  end

  # given(:other_user) { User.create(:email => 'other@example.com', :password => 'eeeeeeee') }

  # scenario "Signing in as another user" do
  #   visit new_user_session_path
  #   within("#new_user") do
  #     fill_in 'Email', :with => other_user.email
  #     fill_in 'Password', :with => other_user.password
  #   end
  #   click_button 'Sign in'
  #   page.should have_content 'Invalid email or password'
  # end
end