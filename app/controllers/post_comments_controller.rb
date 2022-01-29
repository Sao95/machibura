class PostCommentsController < ApplicationController
  # deviseのヘルパーメソッド
  before_action :authenticate_user!,except: [:create]
  
  # 非同期通信
  def create
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
    if user_signed_in?
      # ログインしているユーザーidを紐づける
      @post_comment = current_user.post_comments.new(post_comment_params)
      @post_comment.post_id = @post.id
    else
      # ユーザーidはない
      @post_comment = PostComment.new(post_comment_params)
      @post_comment.post_id = @post.id
    end
    if @post_comment.save
      # flash[:create_comment] = "コメントしました"
    else
      redirect_to post_path(@post), flash: { error: @post_comment.errors.full_messages }
    end
  end
  
  # 非同期通信
  def destroy
    @post_comment = PostComment.find_by(id: params[:id])
    @post = @post_comment.post
    @post_comments = @post.post_comments
    @post_comment.destroy
  end

  def index
    @post_comments = PostComment.where(user_id: current_user.id).page(params[:page]).reverse_order
  end
  
  def destroy_from_index
    @post_comment = PostComment.find_by(id: params[:id])
    @post_comment.destroy
    redirect_to user_post_comments_path(current_user)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id)
  end

end
