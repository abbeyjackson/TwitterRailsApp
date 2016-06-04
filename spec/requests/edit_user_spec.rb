require 'spec_helper'

describe 'Edit User' do

  it 'updates a user when edited' do
    visit '/users/1'
    expect(page).to have_content('Destroy')
    click_link 'Edit'
    expect(page).to have_content('Editing User')
    fill_in 'Email', with: 'newemail@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Update User'
    expect(page).to have_content('User was successfully updated.')
    expect(page).to have_content('Back')
  end
end
