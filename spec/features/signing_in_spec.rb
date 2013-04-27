require 'spec_helper'

feature "Signing in" do
  given(:user) { User.create(email: 'user@example.com', password: 'secretee') }

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
    end
    click_button 'Sign in'
    page.should have_content 'Signed in successfully'
  end

  scenario "Signing in as another user" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => 'other_password'
    end
    click_button 'Sign in'
    page.should have_content 'Invalid email or password'
  end
end