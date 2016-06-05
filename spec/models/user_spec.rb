require 'spec_helper'

RSpec.describe User, type: :model do

  it 'needs an email and password' do
    user = User.new
    expect(user).to be_invalid
  end

  it 'is invalid with only an email' do
    user = User.new(email: "email@test.com")
    expect(user).to be_invalid
  end

  it 'is invalid with only a password' do
    user = User.new(password: "password")
    expect(user).to be_invalid
  end

  it 'is valid with an email and password' do
    user = User.new(email: "email@test.com", password: "password")
    expect(user).to be_valid
  end

  it 'should validate presence of email and password' do
          should validate_presence_of(:email)
          should validate_presence_of(:password)
  end

end
