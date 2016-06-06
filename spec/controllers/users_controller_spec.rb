require 'spec_helper'

describe UsersController do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
   sign_in user
  end

  describe 'GET index' do
    it 'retrieves all users' do
      get :index
      expect(response.status).to eq 200
      expect(assigns(:users).all.count).to eq 2
    end
  end

  describe 'GET #show' do
    it 'shows an individual user' do
      get :show, id: user.id
      expect(response.status).to eq 200
    end
  end

  describe 'DELETE destroy' do
    it "deletes a user and the user's tweets" do
      delete :destroy, id: user.id
      expect(response.status).to eq 302
      expect(User.exists?(email: 'user@test.com')).to be false
    end
  end

end
