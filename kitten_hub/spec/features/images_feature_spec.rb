require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content "No images yet!"
      expect(page).to have_link "Upload an image"
    end
  end

  context 'images have been added' do
    before do
      Image.create(title: 'Kitten')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content("Kitten")
      expect(page).not_to have_content("No images yet!")
    end
  end
end
