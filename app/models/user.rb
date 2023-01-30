class User < ApplicationRecord
  has_secure_password
  has_many :doctors
  has_many :bookings
  validates :name, :email, :password, presence: true
  validates :password, length: { minimum: 6 }
end
