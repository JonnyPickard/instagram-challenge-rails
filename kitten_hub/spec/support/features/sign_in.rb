module Features
  def sign_in
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
  end

  def sign_in_other
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: "test_other@example.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
  end
end
