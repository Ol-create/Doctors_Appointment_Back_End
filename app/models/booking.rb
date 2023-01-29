class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :booking_date, presence: true
end
