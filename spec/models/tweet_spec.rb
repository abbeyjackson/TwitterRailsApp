require 'spec_helper'

RSpec.describe Tweet, type: :model do

  it 'needs a user, title, and a body' do
    tweet = Tweet.new
    expect(tweet).to be_invalid
  end

  it 'is invalid with only a body' do
    tweet = Tweet.new(body: "Message Body")
    expect(tweet).to be_invalid
  end

  it 'is invalid with only a title' do
    tweet = Tweet.new(title: "Message Title")
    expect(tweet).to be_invalid
  end

  it 'is invalid with only a user' do
    tweet = Tweet.new(user_id: users(:testUser).id)
    expect(tweet).to be_invalid
  end

  it 'is valid with a user and a body' do
    tweet = Tweet.new(title: "Message Title", body: "Message Body", user_id: users(:testUser).id)
    expect(tweet).to be_valid
  end

end
