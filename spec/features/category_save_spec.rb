require 'spec_helper'

feature 'Category save' do
  given(:category) { create :category }
  background { sign_in :admin }

  scenario 'Create a new category' do
    visit new_category_path
    within('#new_category') do
      fill_in 'Nom', :with => 'Category name'
    end
    click_button 'Enregistrer la catégorie'
    page.should have_content 'La catégorie a été créée avec succès.'
  end


  scenario 'Update  category' do

    visit edit_category_path(category)
    within("#edit_category_#{category.id}") do
      fill_in 'Nom', :with => 'Another category name'
    end
    click_button 'Enregistrer la catégorie'
    find('.alert-info').should have_content 'La catégorie a été mise à jour avec succès.'
  end
end