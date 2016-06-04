require 'spec_helper'

describe 'Creating User' do

  it 'show the new user on success' do
    visit '/users'
    expect(page).to have_content('Listing Users')
    click_link 'New User'
    expect(page).to have_content('Back')
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Create User'
    expect(page).to have_content('User was successfully created')
    expect(page).to have_content('test@gmail.com')
  end

  it 'returns to the user list on back' do
    visit '/users'
    expect(page).to have_content('Listing Users')
    click_link 'New User'
    expect(page).to have_content('Back')
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'password'
    click_link 'Back'
    expect(page).to have_no_content('User was successfully created')
    expect(page).to have_content('Listing Users')
  end

  it 'gives the user an error on invalid submission' do
    visit '/users'
    expect(page).to have_content('Listing Users')
    click_link 'New User'
    expect(page).to have_content('Back')
    fill_in 'Email', with: 'test@gmail.com'
    click_button 'Create User'
    expect(page).to have_no_content('User was successfully created')
    expect(page).to have_content("Password can't be blank")

    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    click_button 'Create User'
    expect(page).to have_no_content('User was successfully created')
    expect(page).to have_content("Email can't be blank")
  end

end
