require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  describe "when I visit the login page" do
    it 'lets me log into the system' do
      user = User.create!(name: "bob", email: "bob@bob.net", password: 1234)

      visit new_session_path

      fill_in "Email", with: "bob@bob.net"
      fill_in "Password", with: "1234"
      click_button "Login"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("welcome bob!")
      expect(page).to have_content("Log Out")

      visit new_session_path
      expect(current_path).to eq(user_path(user))
    end

    it 'rerenders the page when incorrect creds are entered' do
      user = User.create!(name: "bob", email: "bob@bob.net", password: 1234)

      visit new_session_path

      fill_in "Email", with: "bob@bob.net"
      fill_in "Password", with: "password"
      click_button "Login"

      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to_not have_content("welcome bob!")
    end
  end

  describe 'when I click the log out button' do
    it 'clears returns me to the log in page' do
      User.create!(name: "bob", email: "bob@bob.net", password: 1234)

      visit new_session_path

      fill_in "Email", with: "bob@bob.net"
      fill_in "Password", with: "1234"
      click_button "Login"

      click_link "Log Out"

      expect(current_path).to eq(new_session_path)
    end
  end
end
