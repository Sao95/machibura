class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.save
  end

  def destroy
    @post_comment = PostComment.find_by(id: params[:id])
    @post = @post_comment.post
    @post_comments = @post.post_comments
    @post_comment.destroy
  end

  def index
    @post_comments = PostComment.where(user_id: current_user.id).page(params[:page]).reverse_order
  end

  def edit
    @post_comment = PostComment.find(params[:id])
  end

  def update
    @post_comment = PostComment.find(params[:id])
    @user = current_user
    @post_comment.update!(post_comment_params)
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
