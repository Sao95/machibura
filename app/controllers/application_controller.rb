class ApplicationController < ActionController::Base

  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    posts_path
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
