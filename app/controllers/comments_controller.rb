class CommentsController < ApplicationController

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

end
