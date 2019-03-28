require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :password}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  describe 'class methods' do
    describe '.authenticate' do
      it 'should return a user if both email and password are correct' do
        user = User.create(name: "bob", email: "bob@bob.com", password: 1234)

        authenticated = User.authenticate("bob@bob.com", 1234)
        unauthed_1 = User.authenticate("whenever", 1234)
        unauthed_2 = User.authenticate("bob@bob.com", "incorrect")

        expect(authenticated).to eq(user)
        expect(unauthed_1).to eq(nil)
        expect(unauthed_2).to eq(nil)
      end
    end
  end
end
