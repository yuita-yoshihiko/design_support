class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user == login_from(provider)
      redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました"
    else
      begin
        @user = create_from(provider)

        reset_session
        auto_login(@user)
        redirect_to root_path, success: "#{provider.titleize}アカウントでログインしました"
      rescue
        redirect_to root_path, error: "#{provider.titleize}アカウントでログインに失敗しました"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
