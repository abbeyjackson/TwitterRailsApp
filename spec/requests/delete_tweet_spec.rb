require 'spec_helper'

describe 'Delete Tweet' do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
    login_as user
  end

  it 'deletes a tweet' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'Destroy'
    expect(page).to have_content('JB's Twitter')
    expect(page).to have_content('Tweet was successfully destroyed.')
  end

  it 'does not allow a user to delete a tweet that is not their own' do
    visit '/users/2/tweets/2'
    expect(page).to have_no_content('Destroy')
  end
end
