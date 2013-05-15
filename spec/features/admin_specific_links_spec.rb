require 'spec_helper'

feature 'Admin specific links' do
  background { sign_in :admin }

  scenario "Have a link to user index" do
    visit root_path

    click_link 'Utilisateurs'
    current_path.should == users_path
  end
end