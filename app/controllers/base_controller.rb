class BaseController < ApplicationController

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

end