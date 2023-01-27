require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Nuk Tashino', email: 'nuk@tashino.com', encrypted_password: '123456') }

  it 'should be ok with valid attributes' do
    expect(user).to be_valid
  end

  it 'should not be valid without a username' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should not be valid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'should not be valid without password' do
    user.encrypted_password = nil
    expect(user).to_not be_valid
  end

  it 'should have password with 6 chars minimum' do
    expect(user.encrypted_password.length).to be >= (6)
  end
end