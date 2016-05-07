require 'rails_helper'

feature "User uploads an image" do
  scenario "Successfully" do
    sign_in

    visit '/images'
    click_link 'Upload an image'
    fill_in 'Title', with: 'Kitten'
    fill_in 'Description', with: 'Gangster Kitten'
    click_button 'Upload'
    expect(page).to have_content 'Kitten'
    expect(current_path).to eq '/images'
  end
end
