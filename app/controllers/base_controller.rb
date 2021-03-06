class BaseController < ApplicationController
  layout "application"
  before_action :set_locale

  #覆盖 default_url_options 方法  集中修改 URL 动态生成规则
  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    #中英文url切换
    full_path = request.fullpath
    if full_path.include? "/en/"
      @change_url = "/zh_CN/"+ full_path.gsub("/en/","").gsub("/zh_CN/","")
    elsif full_path.include? "/zh_CN/"
      @change_url ="/en/"+ full_path.gsub("/en/","").gsub("/zh_CN/","")
    elsif full_path == "/en"
      @change_url = "/zh_CN"
    elsif full_path == "/zh_CN"
      @change_url = "/en"
    else
      @change_url = "/en"+full_path
    end
    @title = "Empcl" #默认页面title
  end

end