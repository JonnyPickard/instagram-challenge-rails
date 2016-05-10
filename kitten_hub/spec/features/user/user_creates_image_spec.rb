require 'rails_helper'

feature "User uploads an image" do
  scenario "Successfully" do
    sign_in

    create_image

    expect(page).to have_css('h2', text: 'Test')
    expect(page).to have_xpath("//img[contains(@src, 'test.jpg')]")
  end
end
