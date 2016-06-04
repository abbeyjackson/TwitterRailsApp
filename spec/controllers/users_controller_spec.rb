require 'spec_helper'

describe UsersController do
  let(:user) { users(:testUser) }

  describe 'GET index' do
    it 'retrieves all users' do
      get :index
      expect(response.status).to eq 200
      expect(assigns(:users).all.count).to eq 1
    end
  end

  describe 'GET #show' do
    it 'shows an individual user' do
      get :show, id: user.id
      expect(response.status).to eq 200
    end
  end

  describe 'POST create' do
    it 'creates a new user' do
      post :create, user: { email: 'test@gmail.com', password: 'password' }
      user = User.last

      expect(response.status).to eq 302
      expect(response).to redirect_to user_path(user)
      expect(User.exists?(email: 'test@gmail.com', password: 'password')).to be true
    end
  end

  describe 'PUT update' do
    it 'updates a user after editing' do
      put :update, id: user.id, user: { email: 'newtest@gmail.com', password: 'newpassword' }
      expect(response.status).to eq 302
      expect(User.exists?(email: 'newtest@gmail.com', password: 'newpassword')).to be true
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
