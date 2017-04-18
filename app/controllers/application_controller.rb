class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :getlocal

  #覆盖 default_url_options 方法  集中修改 URL 动态生成规则
  def default_url_options
    { locale: I18n.locale }
  end

  def getlocal
    I18n.locale.to_s
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  # def set_locale
  #   if cookies[:user_locale] && I18n.available_locales.include?(cookies[:user_locale].to_sym)
  #     l = cookies[:user_locale].to_sym
  #   else
  #     l = http_accept_language.compatible_language_from(I18n.available_locales)
  #     cookies.permanent[:user_locale] = l
  #   end
  #   I18n.locale = l || I18n.locale
  # end

end
