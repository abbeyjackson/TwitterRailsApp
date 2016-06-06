require 'spec_helper'

describe TweetsController do
  let(:tweet) { tweets(:test_tweet) }
  let(:user) { users(:test_user) }
  let(:long_body_text) { '111111111 22222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 000000000 111111111 222222222 333333333 444444444 5555' }
  let(:long_title_text) { '111111111 22222222 333333333 444444444 555'}

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
      post :create, user_id: user.id, tweet: { title: 'New Title', body: 'New Body' }
      expect(response.status).to eq 302
      expect(response).to redirect_to user_tweets_path(user)
      expect(Tweet.exists?(body: 'New Body')).to be true
    end

    it 'does not create a tweet if body is blank' do
      post :create, user_id: user.id, tweet: { title: 'Has Blank Body', body: '' }
      expect(response.status).to eq 200
      expect(Tweet.exists?(title: 'Has Blank Body')).to be false
    end

    it 'does not create a tweet if title is blank' do
      post :create, user_id: user.id, tweet: { title: '', body: 'Has Blank Title' }
      expect(response.status).to eq 200
      expect(Tweet.exists?(body: 'Has Blank Title')).to be false
    end

    it 'does not create a tweet if body is more than 140 characters' do
      post :create, user_id: user.id, tweet: { title: 'New', body: long_body_text }
      expect(response.status).to eq 200
      expect(Tweet.exists?(body: 'long_body_text')).to be false
    end

    it 'does not create a tweet if title is more than 40 characters' do
      post :create, user_id: user.id, tweet: { title: long_title_text }
      expect(response.status).to eq 200
      expect(Tweet.exists?(title: 'long_title_text')).to be false
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
