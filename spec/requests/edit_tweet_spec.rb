require 'spec_helper'

describe 'Edit Tweet' do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
    login_as user
  end

  it 'updates a tweet when edited' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'Edit'
    expect(page).to have_content('Editing Tweet')
    fill_in 'Title', with: 'New Tweet Title'
    fill_in 'Body', with: 'New Tweet Body'
    click_button 'Update Tweet'
    expect(page).to have_content('Tweet was successfully updated.')
    expect(page).to have_content('All Tweets')
  end

  it 'does not allow a user to edit a tweet that is not their own' do
    visit '/users/2/tweets/2'
    expect(page).to have_no_content('Edit')
  end
end
