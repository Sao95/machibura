class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save!
    # リダイレクト先を削除することでcreate.js.erbファイルを探すようになる
    # redirect_to request.referer
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(post_id: @post.id, user_id: current_user.id)
    favorite.destroy!
    # redirect_to request.referer
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).reverse_order
  end

end
