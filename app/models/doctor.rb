class Doctor < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :location, :specialization, :price presence: true
end
