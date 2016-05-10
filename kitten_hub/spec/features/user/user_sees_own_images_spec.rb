require 'rails_helper'

feature "User sees own images" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link "Test"

    expect(page).to have_content "Test"
    expect(current_path).to eq "/images/4"
  end
end

feature "User doesn't see others images" do
  scenario "Successfully" do
    sign_in_other

    create_image

    click_link "Sign out"

    sign_in

    expect(page).not_to have_content "Test"
  end
end
