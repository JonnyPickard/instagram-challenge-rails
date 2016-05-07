require 'rails_helper'

feature "Displays upload image prompt" do
  context "No images have been added" do
    scenario "Successfully" do
      sign_in

      expect(page).to have_content "No images yet!"
      expect(page).to have_link "Upload an image"
    end
  end
end
