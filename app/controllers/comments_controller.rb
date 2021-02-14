class CommentsController < ApplicationController

  before_action :user_login

  def create
    @tweet = Tweet.find_by(id: params[:id])
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user

    unless @comment.save
      @errors = @comment.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def user_login
    redirect_to login_path if current_user.nil?
  end

end
