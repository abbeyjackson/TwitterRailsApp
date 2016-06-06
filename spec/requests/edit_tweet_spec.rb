require 'spec_helper'

describe 'Edit Tweet' do
  let(:tweet) { tweets(:test_tweet) }
  let(:user) { users(:test_user) }
  let(:long_body_text) { '111111111 22222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 000000000 111111111 222222222 333333333 444444444 5555' }
  let(:long_title_text) { '111111111 22222222 333333333 444444444 555'}

  before(:each) do
    login_as user
    visit '/users/1/tweets/1'
    expect(page).to have_content('Destroy')
    click_link 'Edit'
    expect(page).to have_content('Editing Tweet')
  end

  it 'updates a tweet when edited' do
    fill_in 'Title', with: 'New Tweet Title'
    fill_in 'Body', with: 'New Tweet Body'
    click_button 'Update Tweet'
    expect(page).to have_content('Tweet was successfully updated.')
    expect(page).to have_content('All Tweets')
  end

  it 'does not update a tweet with title longer than 40 characters' do
      fill_in 'Title', with: long_title_text
      fill_in 'Body', with: 'New Tweet Body'
      click_button 'Update Tweet'
      expect(page).to have_no_content('Tweet was successfully updated')
      expect(page).to have_content('Title is too long (maximum is 40 characters)')
  end

  it 'does not update a tweet with body longer than 140 characters' do
    fill_in 'Title', with: 'Tweet Title'
    fill_in 'Body', with: long_body_text
    click_button 'Update Tweet'
    expect(page).to have_no_content('Tweet was successfully updated')
    expect(page).to have_content('Body is too long (maximum is 140 characters)')
  end

  it 'does not allow a user to edit a tweet that is not their own' do
    visit '/users/2/tweets/2'
    expect(page).to have_no_content('Edit')
  end
end
