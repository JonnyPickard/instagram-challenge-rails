require 'rails_helper'

context 'editing images' do

  before { Image.create(title:'Kitten', description:'Gangster Kitten') }

  scenario 'lets a user edit an image title' do
    visit '/images'
    click_link 'Edit Kitten'
    fill_in 'Title', with: 'Miaowster'
    click_button 'Update'
    expect(page).to have_content 'Miaowster'
    expect(current_path).to eq '/images'
  end
end
