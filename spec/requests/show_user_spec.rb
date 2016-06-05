require 'spec_helper'

describe 'Show User' do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
    login_as user
  end

  it 'redirects to user tweets list when back clicked' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    expect(page).to have_content('Edit')
    click_link 'All Tweets'
    expect(page).to have_no_content('Edit')
    expect(page).to have_content('Listing Tweets')
  end
end
