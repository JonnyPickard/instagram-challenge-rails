require 'rails_helper'

context 'deleting images' do

  before { Image.create(title:'Kitten', description:'Gangster Kitten') }

  scenario 'lets a user delete an image' do
    visit '/images'
    click_link 'Delete Kitten'
    expect(page).to_not have_content('Kitten')
    expect(page).to have_content('Image Deleted')
  end
end
