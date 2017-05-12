class Admins::AdminsController < Admins::BaseController
  def edit
  end

  def update
  end

  def edit_pwd
  end

  def update_pwd
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(:password,:name,:email)
  end
end
