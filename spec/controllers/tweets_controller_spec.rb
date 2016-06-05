require 'spec_helper'

describe TweetsController do
  let(:tweet) { tweets(:testTweet) }
  let(:user) { users(:testUser) }

  before(:each) do
   sign_in user
  end


  describe 'GET index' do
    it 'retrieves all tweets' do
      get :index
      expect(response.status).to eq 200
      expect(assigns(:tweets).all.count).to eq 2
    end
  end

  describe 'GET #show' do
    it 'shows an individual tweet' do
      get :show, user_id: user.id, id: tweet.id
      expect(response.status).to eq 200
    end
  end

  describe 'GET #new' do
    it 'shows a blank new tweet form' do
      get :new, user_id: user.id
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    it 'shows an edit form for the requested tweet' do
      get :new, user_id: user.id, id: tweet.id
      expect(response.status).to eq 200
    end
  end

  describe 'POST create' do
    it 'creates a new tweet' do
      post :create, user_id: user.id, tweet: { title: 'New', body:'New Body' }
      tweet = Tweet.last

      expect(response.status).to eq 302
      expect(response).to redirect_to user_tweets_path(user)
      expect(Tweet.exists?(body: 'New Body')).to be true
    end
  end

  describe 'PUT update' do
    it 'updates a tweet after editing' do
      put :update, user_id: user.id, id: tweet.id, tweet: { title: 'Edited', body:'Edited Body' }
      expect(response.status).to eq 302
      expect(Tweet.exists?(body: 'Edited Body')).to be true
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a tweet' do
      delete :destroy, user_id: user.id, id: tweet.id
      expect(response.status).to eq 302
      expect(Tweet.exists?(body: 'Message Body')).to be false
    end
  end

end
