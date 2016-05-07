require 'rails_helper'

feature "User sign in" do
  scenario "Successfully" do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')

    expect(page).not_to have_link('Sign out')

    sign_in

    expect(page).to have_link('Sign out')
  end
end
