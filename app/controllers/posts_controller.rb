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
    # 検索結果をpostsのindexの形式で表示する
    # @posts = Post.allを ↓ に書き換える
    @posts = @search.result
    @post_favorites_count = @posts.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # 検索してない場合は全てのデータが返ってくる
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    # 前ページセッションを定義
    session[:previous_url] = request.referer
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
    @user = current_user
    @post.destroy
    # 前ページセッションへ遷移
    # session[:previous_url] → showで定義
    redirect_to session[:previous_url]
  end

  private

  def post_params
    params.require(:post).permit(:image, :writings, :place, :station, :address, :latitude, :longitude)
  end
  
end
