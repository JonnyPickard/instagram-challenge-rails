require 'rails_helper'

feature "User deletes image" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link 'Delete Test'

    expect(page).to have_content "Image Deleted"
  end
end
