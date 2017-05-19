class Admins::SessionsController < Devise::SessionsController
  layout "login"
  # before_action :authenticate_admin!  ,except: :new


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   # super
  #   signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  #   set_flash_message! :notice, :signed_out if signed_out
  #   yield if block_given?
  #   redirect_to action: :new
  # end

  def after_sign_out_path_for(resource_or_scope)
    "/admin/sign_in"
  end

  def after_sign_in_path_for(resource_or_scope)
    "/admin/messages"
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
