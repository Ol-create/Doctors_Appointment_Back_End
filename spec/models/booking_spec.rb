require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validation tests' do
    subject do
      @usero = User.new(name: 'Nuk Tashino', email: 'nuk@tashino.com', password: '123456',
                            password_confirmation: '123456')
      @doctoro = Doctor.new(user_id: @usero.id, name: 'Rick', location: 'Ireland',
                                specialization: 'Pathologist', price: 400)
      Booking.new(user_id: @usero.id, doctor_id: @doctoro.id, booking_date: '27-01-2023')
    end

    before { subject.save }

    it 'booking date should be present' do
      subject.booking_date = nil
      expect(subject).to_not be_valid
    end
  end
end