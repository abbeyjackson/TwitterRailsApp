require 'spec_helper'

describe 'Creating Tweet' do
  let(:tweet) { tweets(:test_tweet) }
  let(:user) { users(:test_user) }
  let(:long_body_text) { '111111111 22222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 000000000 111111111 222222222 333333333 444444444 5555' }
  let(:long_title_text) { '111111111 22222222 333333333 444444444 555'}

  before(:each) do
    login_as user
    visit root_path
    expect(page).to have_content("JB's Twitter")
    click_link 'New Tweet'
    expect(page).to have_content('Cancel')
  end

  it 'redirects to the user tweets list on success' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_content('Tweet was successfully created')
    expect(page).to have_content("JB's Twitter")
  end

  it 'returns to the tweets list on cancel' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: 'Tweet Body'
    click_link 'Cancel'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content("JB's Twitter")
  end

  it 'gives the user an error if body left blank' do
    fill_in 'Title', with: 'Tweet Title'
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content("Body can't be blank")
  end

  it 'gives the user an error if title left blank' do
    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content("Title can't be blank")
  end

  it 'gives the user an error if title longer than 40 character' do
    fill_in 'Title', with: long_title_text
    fill_in 'Body', with: 'Tweet Body'
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content('Title is too long (maximum is 40 characters)')
  end

  it 'gives the user an error if body longer than 140 characters' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: long_body_text
    click_button 'Create Tweet'
    expect(page).to have_no_content('Tweet was successfully created')
    expect(page).to have_content('Body is too long (maximum is 140 characters)')
  end

end
