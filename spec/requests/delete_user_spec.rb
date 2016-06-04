require 'spec_helper'

describe 'Delete User' do

  it "deletes a user" do
    visit '/users'
    expect(page).to have_content('Listing Users')
    click_link 'Destroy'
    expect(page).to have_content('User was successfully destroyed.')
  end
end
