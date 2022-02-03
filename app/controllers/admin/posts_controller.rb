class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      # 投稿した画像をAPI側に渡す
      tags = Vision.get_image_data(@post.image)
      # API側から返ってきた値をもとにタグを作成する
      tags.each do |tag|
      @post.tags.create(name: tag)
    end
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