class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy retweet]
  before_action :user_login, except: %I[index show]

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: 'Tweet was successfully created.'
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def user_login
    redirect_to login_path if current_user.nil?
  end
end