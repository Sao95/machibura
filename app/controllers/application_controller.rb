class ApplicationController < ActionController::Base

  # deviseの機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :find_current_user

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      flash[:success] = "ログインしました。"
      admin_users_path
    else
      flash[:success] = "ようこそ#{current_user.name}さん"
      posts_path
    end
  end

  # sidebarのコメント履歴、お気に入り履歴リンクのuser.id
  def find_current_user
    @user = current_user
  end

  def set_search
    # 検索オブジェクト
    @search = Post.ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    # sign_upの際に、nameのデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
