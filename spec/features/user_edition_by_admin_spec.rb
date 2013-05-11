require 'spec_helper'

feature 'User edition by admin' do
  given(:admin) { create :user, :admin }
  background { sign_in :admin }

  scenario "Remove admin role" do
    visit edit_user_path(admin)
    within("#edit_user_#{admin.id}") do
      uncheck 'admin'
    end
    click_button 'Update User'
    find('.alert-info').should have_content 'User was successfully updated.'
    User.last.roles_name.should eql ['member']
  end
end