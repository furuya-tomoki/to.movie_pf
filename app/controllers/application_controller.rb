class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   # devise利用の機能
    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :image, :encrypted_password])
    # ユーザー登録時に必要な値

  end
end
