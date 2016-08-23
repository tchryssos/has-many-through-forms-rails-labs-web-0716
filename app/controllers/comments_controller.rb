class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @post=Post.find(params[:post_id])
    @post.comments<<@comment
    redirect_to "/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :post, :user_id, user_attributes:[:username])
  end
end
