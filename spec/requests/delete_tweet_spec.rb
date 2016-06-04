require 'spec_helper'

describe 'Delete Tweet' do

  it 'deletes a tweet' do
    visit '/users/1/tweets'
    expect(page).to have_content('Listing Tweets')
    click_link 'Destroy'
    expect(page).to have_content('Tweet was successfully destroyed.')
  end
end
