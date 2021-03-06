class PostsController < ApplicationController
  # deviseのヘルパーメソッド
  before_action :authenticate_user!, only: [:destroy, :destroy_from_user_show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if user_signed_in?
      # current_user → deviseのヘルパーメソッド
      # ログイン中のユーザー情報を取得
      @post.user_id = current_user.id
    end
    if @post.save
      @post.create_tags
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    # 検索結果をpostsのindexの形式で表示する
    # @posts = Post.allを ↓ に書き換える
    @posts = @search.result.page(params[:page]).reverse_order
    # 検索してない場合は全てのデータが返ってくる
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def destroy_from_user_show
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  def runking
    @posts = Post.most_favorite
  end

  private

  def post_params
    params.require(:post).permit(:image, :writings, :prefecture, :place, :latitude, :longitude)
  end

end