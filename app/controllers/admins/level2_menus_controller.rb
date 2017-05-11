class Admins::Level2MenusController < Admins::BaseController
  before_action :set_admins_level2_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level2_menus
  def index
    @menus = Level2Menu.all.order('position asc').page(params[:page] || 1).per(10)
  end

  # GET /admins/level2_menus/1
  def show
  end

  # GET /admins/level2_menus/new
  def new
    @menu = Level2Menu.new
  end

  # GET /admins/level2_menus/1/edit
  def edit
  end

  # POST /admins/level2_menus
  def create
    @menu = Level2Menu.new(menu_params)

    if @menu.save
      redirect_to admins_level2_menus_url, notice: '二级菜单创建成功!'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level2_menus/1
  def update
    if @menu.update(menu_params)
      redirect_to admins_level2_menus_url, notice: '二级菜单更新成功!'
    else
      render :edit
    end
  end

  # DELETE /admins/level2_menus/1
  def destroy
    @menu.destroy
    redirect_to admins_level2_menus_url, notice: '二级菜单删除成功'
  end

  def move_position
    menu = Level2Menu.find(params[:id])
    notice = ''
    case params[:type]
      when 'pre'
        menu.move_higher
        notice = '二级菜单上移成功!'
      when 'next'
        menu.move_lower
        notice = '二级菜单下移成功!'
      when 'first'
        menu.move_to_top
        notice = '二级菜单置顶成功!'
      when 'last'
        menu.move_to_bottom
        notice = '二级菜单置底成功!'
    end
    redirect_to admins_level2_menus_path, notice: notice

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_level2_menu
      @menu = Level2Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:level2_menu).permit(:level1_menu_id,:name,:en_name,:show_type,:position, :link)
    end
end
