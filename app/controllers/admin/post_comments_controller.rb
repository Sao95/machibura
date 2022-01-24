class Admin::PostCommentsController < ApplicationController
  
  def index
    @post_comments = PostComment.all.page(params[:page]).reverse_order
  end
  
  def destroy
    @post_comment = PostComment.find_by(id: params[:id])
    @post_comment.destroy
    redirect_to admin_post_comments_path
  end

end
