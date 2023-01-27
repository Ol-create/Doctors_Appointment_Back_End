class User < ApplicationRecord
  has_many :doctors
  validates :name, :email, :encrypted_password, presence: true
  validates :encrypted_password, length: { minimum: 6 }
end
