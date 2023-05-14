class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    return redirect_to(root_path, notice: 'ログインをキャンセルしました') if auth_params[:denied].present?

    @user = login_from(provider)
    if @user
      redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました"
    else
      create_user_and_login(provider)
    end
    rescue ActiveRecord::RecordNotUnique
      redirect_to root_path, error: "#{provider.titleize}ログインに失敗しました。他の方法でユーザー登録されている可能性があります。"
    rescue
      redirect_to root_path, error: "#{provider.titleize}アカウントでのログインに失敗しました"
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end

  def create_user_and_login(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
    redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました"
  end
end
