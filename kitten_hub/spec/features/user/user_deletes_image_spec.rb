require 'rails_helper'

feature "User deletes image" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link 'Delete Kitten'

    expect(page).to_not have_content "Kitten"
    expect(page).to have_content "Image Deleted"
  end
end
