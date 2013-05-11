require 'spec_helper'

feature 'Link creation' do
  background { sign_in :admin }

  scenario "Create a new link" do
    visit new_link_path
    within("#new_link") do
      fill_in 'Name', :with => 'That link deals with...'
      fill_in 'Url', :with => 'http://some-url.com'
    end
    click_button 'Create Link'
    find('.alert-info').should have_content 'Link was successfully created.'
    Link.last.user_id.should eql 1
  end
end