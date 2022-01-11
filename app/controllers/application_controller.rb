class ApplicationController < ActionController::Base
  
  # sign_upの際に、nameのデータ操作を許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
