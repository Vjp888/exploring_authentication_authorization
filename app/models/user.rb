class User < ApplicationRecord
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    where(email: email, password: password).first
  end
end
