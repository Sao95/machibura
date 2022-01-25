class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_post_path(@post)
    else
      flash[:alert] = "更新が失敗しました。"
      redirect_to admin_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "削除しました。"
      redirect_to admin_posts_path
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :writings, :address, :latitude, :longitude)
  end
  
end