# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   devise_create
  # end
  
  # def devise_create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end
  
  # def failed
  #   redirect_to new_user_session_path
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  
  # def auth_options
  #   { scope: resource_name, recall: "#{controller_path}#failed" }
  # end
  
  # 退会しているかどうか
  def user_state
    # 入力されたemailからアカウントを探す
    @user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    # valid_password? → 特定のアカウントのパスワードと入力されたパスワードが一致しているかを確認するためのDevise が用意しているメソッド
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted == true
      redirect_to new_user_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
