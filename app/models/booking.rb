class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :bookingdate, presence: true
  validates :is_active, inclusion: [true, false]
  validates :duration, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 8 }
end
