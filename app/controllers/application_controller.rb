class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :getlocal

  def getlocal
    I18n.locale.to_s
  end

  # 取得当前用户的ip地址
  def now_ip
    x_forwarded_ip = request.env["HTTP_X_FORWARDED_FOR"].to_s.split(',').first.to_s
    x_forwarded_ip.strip!
    if x_forwarded_ip.present?
      return x_forwarded_ip
    else
      return request.remote_ip
    end
    # return request.env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end
end
