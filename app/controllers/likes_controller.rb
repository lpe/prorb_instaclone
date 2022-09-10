class LikesController < ApplicationController
  
  def post_like
    @post = Post.find(params[:post_id])
    current_user.like_post!(@post)
  end

  def post_unlike
    @post = current_user.posts.find_by(id: params[:post_id])
    @post.likes.where(likable_id: @post.id).delete_all
  end

  def comment_like
    @comment = Comment.find(params[:comment_id])
    current_user.like_comment!(@comment)
  end

  def comment_unlike
    @post = current_user.posts.find_by(id: params[:post_id])
    @comment = current_user.comments.find_by(id: params[:comment_id])
    @comment.likes.where(likable_id: @comment.id).delete_all
  end

end