class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy retweet]
  before_action :user_login, except: %I[index show]

  def index
    @tweets = Tweet.all.order('created_at DESC').includes(%i[user comments])
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

  def retweet
    @retweet = Tweet.new(content: @tweet.content, parent_id: @tweet.id, user_id: current_user.id)
    if @retweet.save
    redirect_to root_path, notice: 'Retweet was successfully created.'
    else
      render(
        html: "<script>alert('Some Problem occured!')</script>".html_safe,
        layout: 'application'
      )
    end
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