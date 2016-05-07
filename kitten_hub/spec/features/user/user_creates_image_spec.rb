require 'rails_helper'

feature "User uploads an image" do
  scenario "Successfully" do
    sign_in

    create_image

    expect(page).to have_content 'Kitten'
    expect(current_path).to eq '/images'
  end
end
