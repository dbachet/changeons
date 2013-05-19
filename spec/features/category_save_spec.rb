require 'spec_helper'

feature 'Category save' do
  given(:category) { create :category }
  given(:submit) { 'Enregistrer la catégorie' }
  background { sign_in :admin }

  scenario 'Create a new category' do
    visit new_category_path
    within('#new_category') do
      fill_in 'Nom', with: 'Category name'
      fill_in 'Couleur', with: 'A color code'
    end
    click_button submit
    page.should have_content 'La catégorie a été créée avec succès.'
    Category.last.name.should eql 'Category name'
    Category.last.color.should eql 'A color code'
  end

  scenario 'Update category' do
    visit edit_category_path(category)
    within("#edit_category_#{category.id}") do
      fill_in 'Nom', with: 'Another category name'
      fill_in 'Couleur', with: 'Another color code'
    end

    click_button submit
    find('.alert-info').should have_content 'La catégorie a été mise à jour avec succès.'
    Category.last.name.should eql 'Another category name'
    Category.last.color.should eql 'Another color code'
  end
end