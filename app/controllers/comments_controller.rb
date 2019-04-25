class CommentsController < ApplicationController

  def create
    params[:comment].delete(:user_attributes) if params[:comment][:user_attributes][:username].empty?
    comment = Comment.create(comment_params)
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
