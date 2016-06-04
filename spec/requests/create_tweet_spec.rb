require 'spec_helper'

describe 'Creating Tweet' do

  it 'redirects to the user tweets list on success' do
    visit '/users/1/tweets'
    expect(page).to have_content('Listing Tweets')
    click_link 'New Tweet'
    expect(page).to have_content('Cancel')
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_content('Tweet was successfully created')
    expect(page).to have_content('Listing Tweets')
  end

  it 'returns to the user tweets list on cancel' do
    visit '/users/1/tweets'
    expect(page).to have_content('Listing Tweets')
    click_link 'New Tweet'
    expect(page).to have_content('Cancel')
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_link 'Cancel'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content('Listing Tweets')
  end

  it 'gives the user an error on invalid submission' do
    visit '/users/1/tweets'
    expect(page).to have_content('Listing Tweets')
    click_link 'New Tweet'
    expect(page).to have_content('Cancel')
    fill_in 'Title', with: 'Tweet Title'
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content("Body can't be blank")

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content("Title can't be blank")
  end

end
