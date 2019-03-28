require 'rails_helper'

RSpec.describe 'as a user' do
  it 'only lets logged in users reach the secret page' do
    user = User.create(name: "bob", email: "bob@bob.net", password: 1234)

    visit '/secret'
    expect(current_path).to eq(new_session_path)

    fill_in "Email", with: "bob@bob.net"
    fill_in "Password", with: "1234"
    click_button "Login"

    visit '/secret'

    expect(current_path).to eq(secret_user_path)
    expect(page).to have_content("You found a secret bob!")
  end
end
