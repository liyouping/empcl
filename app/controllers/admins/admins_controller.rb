class Admins::AdminsController < Admins::BaseController
  before_action :set_admin, only: [:show, :edit, :update,:edit_pwd,:update_pwd]
  def edit
    pp "====pwd #{current_admin.password}==="
  end

  def update
    if @admin.valid?
      if @admin.update(admin_params)
        redirect_to action: :show, notice: '修改成功!'
      else
        @errors = @admin.errors.as_json(full_messages: true).to_json
        render :edit
      end
    else
      @errors = @admin.errors.as_json(full_messages: true).to_json
      render :edit
    end
  end

  def show

  end

  def edit_pwd

  end

  def update_pwd
      if @admin.update(admin_params)
        redirect_to action: :edit_pwd, notice: '密码修改成功!'
      else
        @errors = @admin.errors.as_json(full_messages: true).to_json
        render :edit_pwd
      end
  end

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(:name,:email,:password,:password_confirmation,:old_password)
  end
end
