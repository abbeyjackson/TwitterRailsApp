require 'spec_helper'

describe 'Delete Tweet' do

  it 'deletes a tweet' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'Destroy'
    expect(page).to have_content('Listing Tweets')
    expect(page).to have_content('Tweet was successfully destroyed.')
  end
end
