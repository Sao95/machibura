class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to post_path(@post)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to request.referer
  end

  def index
    @user = current_user
  end

  # def edit
  #   @user = current_user
  #   @post_comment = PostComment.find(params[:id])
  # end

  # def update
  #   @post_comment = PostComment.find(params[:id])
  #   @user = current_user
  #   @post_comment.update(post_comment_params)
  #   redirect_to user_post_comments_path(@user)
  # end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def post_params
    params.require(:post).permit(:place, :station, :writings)
  end

end
