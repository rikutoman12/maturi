class ApplicationController < ActionController::Base
   #indexページとaページ以外は会員以外ログイン出来ない
  before_action :authenticate_user!,except: [:index,:a]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
