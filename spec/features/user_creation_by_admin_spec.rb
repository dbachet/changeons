require 'spec_helper'

feature 'User creation by admin' do
  background { sign_in :admin }

  scenario "Signing up without role" do
    visit new_user_path
    within("#new_user") do
      fill_in 'Email', :with => 'test@example.com'
      fill_in 'Password', :with => 'testtest'
      fill_in 'Password confirmation', :with => 'testtest'
    end
    click_button 'Create User'
    find('.alert-info').should have_content 'User was successfully created.'
    User.last.roles_name.should eql ['member']
  end

  scenario "Signing up with admin role" do
    visit new_user_path
    within("#new_user") do
      fill_in 'Email', :with => 'test@example.com'
      fill_in 'Password', :with => 'testtest'
      fill_in 'Password confirmation', :with => 'testtest'
    end
    check 'admin'
    click_button 'Create User'
    find('.alert-info').should have_content 'User was successfully created.'
    User.last.roles_name.should eql ['admin']
  end
end