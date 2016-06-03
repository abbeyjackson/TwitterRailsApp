class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :get_user

  respond_to :html

  def get_user
    if params[:user_id]
    @user = User.find(params[:user_id])
    end
  end

  # GET /tweets
  # GET /tweets.json
  def index
    if @user == nil
      @tweets = Tweet.all
    else
      @tweets = @user.tweets
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = @user.tweets.find(params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = @user.tweets.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@tweet], notice: 'Tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to [@user, @tweet], notice: 'Tweet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end
end
