require 'rails_helper'

feature "User sees own images" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link "Kitten"

    expect(page).to have_content "Kitten"
    expect(current_path).to eq "/images/4"
  end
end

feature "User doesn't see others images" do
  scenario "Successfully" do
    sign_in_other

    create_image

    click_link "Sign out"

    sign_in

    expect(page).not_to have_content "Kitten"
  end
end
