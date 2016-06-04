require 'spec_helper'

describe 'Show Tweet' do

  it 'redirects to user tweets list when back clicked' do
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'Back'
    expect(page).to have_no_content('Back')
    expect(page).to have_content('Listing Tweets')
  end
end
