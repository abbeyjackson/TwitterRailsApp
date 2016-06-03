require 'rails_helper'

describe TweetsController do
  let(:tweet) { tweets(:one) }
  let(:user) { users(:testUser) }

  describe 'GET index' do
    it 'retrieves all tweets' do
      get :index
      expect(response.status).to eq 200
      expect(assigns(:tweets).all.count).to eq 1
    end
  end
end
