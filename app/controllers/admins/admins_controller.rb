class Admins::AdminsController < Admins::BaseController
  before_action :set_admin, only: [:show, :edit, :update]
  def edit
  end

  def update
  end

  def show

  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(:name,:email)
  end
end
