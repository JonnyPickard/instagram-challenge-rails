require 'rails_helper'

feature "User edits image" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link "Edit Test"
    fill_in "Title", with: "Miaowster"
    click_button "Update"

    expect(page).to have_content "Miaowster"
    expect(current_path).to eq "/images"
  end
end
