class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(params[:comment].permit(:text))
    @comments.user_id = session[:current_user_id]
    @comments.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to post_path(params[:post_id])
  end
end
