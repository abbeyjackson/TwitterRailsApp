require 'spec_helper'

describe 'Show Tweet' do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
    login_as user
  end

  it 'redirects to user tweets list when All Tweets clicked' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'All Tweets'
    expect(page).to have_no_content('Edit')
    expect(page).to have_content('JB's Twitter')
  end
end
