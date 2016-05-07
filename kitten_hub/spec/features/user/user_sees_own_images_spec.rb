require 'rails_helper'

feature "User sees own images" do
  scenario "Successfully" do
    sign_in

    create_image

    click_link "Kitten"

    expect(page).to have_content "Kitten"
    expect(current_path).to eq "/images/1"
  end
end
