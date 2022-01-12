class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # current_user → deviseのヘルパーメソッド
    # ログイン中のユーザー情報を取得
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end

  
  private

  def post_params
    params.require(:post).permit(:image, :writings, :place, :station)
  end
end