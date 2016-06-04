require 'spec_helper'

describe 'Delete User' do

  it "deletes a user" do
    visit '/users/1'
    expect(page).to have_content('Destroy')
    click_link 'Destroy'
    expect(page).to have_content('Listing Users')
    expect(page).to have_content('User was successfully destroyed.')
  end
end
