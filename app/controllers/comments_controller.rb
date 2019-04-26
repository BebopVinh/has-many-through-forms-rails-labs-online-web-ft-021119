class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      @post = comment.post
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
