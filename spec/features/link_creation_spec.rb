require 'spec_helper'

feature 'Link creation' do
  background { sign_in :admin }

  scenario "Create a new link" do
    visit new_link_path
    within("#new_link") do
      fill_in 'Description', :with => 'That link deals with...'
      fill_in 'URL', :with => 'http://some-url.com'
    end
    click_button 'Enregistrer le lien'
    find('.alert-info').should have_content 'Le lien a été créé avec succès.'
    Link.last.user_id.should eql 1
  end
end