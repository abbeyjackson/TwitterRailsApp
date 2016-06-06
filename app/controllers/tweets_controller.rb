class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_tweet, only: [:edit, :update, :destroy]
  before_filter :find_user
  before_action :authenticate_user_owns_tweet, only: [:edit, :update, :destroy]

  respond_to :html

  # GET /tweets
  # GET /tweets.json
  def index
    if params[:user_id]
      @tweets = @user.tweets
    else
      @tweets = Tweet.all
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
    @tweet = current_user.tweets.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to user_tweets_path(@user), notice: 'Tweet was successfully created.' }
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
      format.html { redirect_to root_path, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Find user for tweet
    def find_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def find_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:title, :body)
    end

    # Check that the user owns the tweet before allowing actions on it
    def authenticate_user_owns_tweet
      if current_user.id != @tweet.user_id
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Sorry you can not take action on other user's tweets" }
        end
      end
    end
end
