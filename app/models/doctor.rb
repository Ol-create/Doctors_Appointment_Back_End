class Doctor < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 15, minimum: 5 }, format: {
    with: /\A\+?\d+\z/, message: 'has invalid format'
  }
  validates :rates, presence: true, numericality: { greater_than: 0 },
                    format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: 'max two decimal positions' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is not valid' }
  validates :bio, :location, :avatar, presence: true
  validates :avatar, content_type: { in: %w[image/jpeg image/png image/gif], message: 'must be a valid image format' },
                     size: { less_than_or_equal_to: 1.megabytes, message: 'should not be greater than 1 MB' }

  def avatar_url
    rails_blob_url(avatar)
  end
end
