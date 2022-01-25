class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post_comments = PostComment.all.page(params[:page]).reverse_order
  end
  
  def destroy
    @post_comment = PostComment.find_by(id: params[:id])
    if @post_comment.destroy
      flash[:destroy] = "削除しました。"
      redirect_to request.referer
    end
  end

end
