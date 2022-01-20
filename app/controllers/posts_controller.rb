class PostsController < ApplicationController
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
    @post.save
    redirect_to posts_path
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

  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   @post.update(post_params)
  #   redirect_to post_path(@post.id)
  # end

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

  private

  def post_params
    params.require(:post).permit(:image, :writings, :place, :station, :address, :latitude, :longitude)
  end

end