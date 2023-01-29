class Doctor < ApplicationRecord
  belongs_to :user
  validates :name, :location, :specialization, presence: true
end
