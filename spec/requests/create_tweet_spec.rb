require 'spec_helper'

describe 'Creating Tweet' do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
    login_as user
    visit root_path
    expect(page).to have_content('JB's Twitter')
    click_link 'New Tweet'
    expect(page).to have_content('Cancel')
  end

  it 'redirects to the user tweets list on success' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_content('Tweet was successfully created')
    expect(page).to have_content('JB's Twitter')
  end

  it 'returns to the tweets list on cancel' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_link 'Cancel'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content('JB's Twitter')
  end

  it 'gives the user an error on invalid submission' do
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
