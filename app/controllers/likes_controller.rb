class LikesController < ApplicationController

  def create
    @tweet = Tweet.find_by(id: params[:id])
    @like = current_user.likes.find_or_initialize_by(tweet_id: @tweet.id)
    @like.active? ? @like.active = false : @like.active = true
    @like.save
  end
end
