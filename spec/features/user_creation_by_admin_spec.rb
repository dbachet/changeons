require 'spec_helper'

feature 'User creation by admin' do
  background { sign_in :admin }

  scenario "Signing up without role" do
    visit new_user_path
    within("#new_user") do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Nom', with: 'Mr Test'
      fill_in 'Mot de passe', with: 'testtest'
      fill_in 'Confirmation du mot de passe', with: 'testtest'
    end
    click_button 'Enregistrer l\'utilisateur'
    find('.alert-info').should have_content 'L\'utilisateur a été créé avec succès.'
    User.last.roles_name.should eql ['member']
  end

  scenario "Signing up with admin role" do
    visit new_user_path
    within("#new_user") do
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Nom', with: 'Mr Test'
      fill_in 'Mot de passe', with: 'testtest'
      fill_in 'Confirmation du mot de passe', with: 'testtest'
    end
    check 'admin'
    click_button 'Enregistrer l\'utilisateur'
    find('.alert-info').should have_content 'L\'utilisateur a été créé avec succès.'
    User.last.roles_name.should eql ['admin']
  end
end