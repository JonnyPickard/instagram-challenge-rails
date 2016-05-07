require 'rails_helper'

feature "User sign out" do
  scenario "Successfully" do
    sign_in
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')

    expect(page).to have_link('Sign out')

    click_link('Sign out')
    expect(page).to have_link('Sign in')
  end
end
