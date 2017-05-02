class Admins::BaseController < ApplicationController

  layout "admin"
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |params|
      # params.permit(:tel_num, :email)
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :tel_num])
    end
  end


  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    per_page = params[:per_page].present? ? params[:per_page] : 10
    resource = resource.per(per_page)
    return resource
  end
end
