require 'rails_helper'

feature "Displays upload image prompt" do
  context "No images have been added" do
    scenario "Successfully" do
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
