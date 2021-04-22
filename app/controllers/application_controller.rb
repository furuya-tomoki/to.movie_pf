class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 before_action :set_search

  def set_search
    @movies = Movie.all
    @q = Movie.ransack(params[:q])
     # params[:q] = ユーザーが記入したキーワード
    @movies = @q.result(didtinct: true)
     # distinct = 重複レコードを一つにまとめる
     # rusult = レコードリレーションを返す
  end

  # devise利用の機能
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :image, :encrypted_password])
    # ユーザー登録+編集時に必要な値
  end
end
