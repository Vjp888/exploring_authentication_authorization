require 'rails_helper'

RSpec.describe 'lets a user register to the website' do
  it 'should let a user register' do
    visit new_user_path

    fill_in 'Email', with: "bob@bob.net"
    fill_in "Password", with: "1234"
    fill_in "Name", with: "bob"
    click_button "Create User"

    expect(User.last.name).to have_content("bob")
    expect(User.last.password).to have_content("1234")
    expect(User.last.email).to have_content("bob@bob.net")
  end
end
