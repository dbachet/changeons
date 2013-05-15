require 'spec_helper'

feature "Signing in" do
  given(:user) { User.create(email: 'user@example.com', password: 'secretee') }

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Mot de passe', :with => user.password
    end
    click_button 'Se connecter'
    page.should have_content 'Connecté avec succès.'
  end

  scenario "Signing in as another user" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', :with => user.email
      fill_in 'Mot de passe', :with => 'other_password'
    end
    click_button 'Se connecter'
    page.should have_content 'Email ou mot de passe incorrect.'
  end
end