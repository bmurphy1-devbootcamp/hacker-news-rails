class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(params[:comment].permit(:text))
    @comments.user_id = session[:current_user_id]
    @comments.save # consider failure case here, what should happen if we can't save?
    redirect_to post_path(params[:post_id])
  end

  def destroy
    Comment.destroy(params[:id]) # failure case?
    redirect_to post_path(params[:post_id])
  end
end
