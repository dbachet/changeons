require 'spec_helper'

feature 'Edit profile' do
  given(:user) { User.create(email: 'user@example.com', name: 'Thomas Magnum', password: 'testtest') }

  background { sign_in }

  scenario 'with name' do
    visit edit_user_registration_path
    find('#user_email').set('user@test.com')
    find('#user_name').set('Gilberto Magnum')
    find('#user_password').set('humhumhum')
    find('#user_password_confirmation').set('humhumhum')
    find('#user_current_password').set('testtest')
    click_button 'Mettre à jour l\'utilisateur'
    page.should have_content 'Votre compte a été modifié avec succès.'
    User.last.email.should eql 'user@test.com'
    User.last.name.should eql 'Gilberto Magnum'
  end
end