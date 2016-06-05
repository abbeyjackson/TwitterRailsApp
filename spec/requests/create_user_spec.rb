require 'spec_helper'

describe 'Creating User' do

  before(:each) do
    visit root_path
    expect(page).to have_content('Listing Tweets')
    click_link 'Create Account'
    expect(page).to have_content('Back')
  end

  it 'shows the tweets list on success' do
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'
    # expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Listing Tweets')
  end

  it 'returns to the tweet list on back' do
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_link 'Back'
    expect(page).to have_no_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Listing Tweets')
  end

  it 'gives the user an error on invalid submission' do
    fill_in 'Email', with: 'test@gmail.com'
    click_button 'Create Account'
    expect(page).to have_no_content('Welcome! You have signed up successfully.')
    expect(page).to have_content("Password can't be blank")

    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'
    expect(page).to have_no_content('Welcome! You have signed up successfully.')
    expect(page).to have_content("Email can't be blank")
  end

end
