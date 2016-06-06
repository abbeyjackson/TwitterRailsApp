require "spec_helper"

RSpec.describe TweetsController, type: :routing do
  describe "routing" do

    it "routes root to #index" do
      expect(:get => "/").to route_to("tweets#index")
    end

    it "routes to #index" do
      expect(:get => "/users/1/tweets").to route_to("tweets#index", :user_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/users/1/tweets/new").to route_to("tweets#new", :user_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/tweets/1").to route_to("tweets#show", :id => "1", :user_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1//tweets/1/edit").to route_to("tweets#edit", :id => "1", :user_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/tweets").to route_to("tweets#create", :user_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/tweets/1").to route_to("tweets#update", :id => "1", :user_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/tweets/1").to route_to("tweets#update", :id => "1", :user_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1/tweets/1").to route_to("tweets#destroy", :id => "1", :user_id => "1")
    end

  end
end
