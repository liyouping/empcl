class Admins::Level3MenusController < Admins::BaseController
  before_action :set_admins_level3_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level3_menus
  def index
    @menus = Level3Menu.all.order('position asc').page(params[:page] || 1).per(10)
  end

  # GET /admins/level3_menus/1
  def show
  end

  # GET /admins/level3_menus/new
  def new
    @menu = Level3Menu.new
  end

  # GET /admins/level3_menus/1/edit
  def edit
  end

  # POST /admins/level3_menus
  def create
    @menu = Level3Menu.new(admins_level3_menu_params)

    if @menu.save
      redirect_to admins_level3_menus_url, notice: '三级菜单创建成功!'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level3_menus/1
  def update
    if @menu.update(admins_level3_menu_params)
      redirect_to admins_level3_menus_url, notice: '三级菜单更新成功!'
    else
      render :edit
    end
  end

  # DELETE /admins/level3_menus/1
  def destroy
    @menu.destroy
    redirect_to admins_level3_menus_url, notice: '三级菜单删除成功!'
  end

  def move_position
    menu = Level3Menu.find(params[:id])
    notice = ''
    case params[:type]
      when 'pre'
        menu.move_higher
        notice = '三级菜单上移成功!'
      when 'next'
        menu.move_lower
        notice = '三级菜单下移成功!'
      when 'first'
        menu.move_to_top
        notice = '三级菜单置顶成功!'
      when 'last'
        menu.move_to_bottom
        notice = '三级菜单置底成功!'
    end
    redirect_to admins_level3_menus_path, notice: notice

  end

  def level2_menus
    level2_menu_list = Level2Menu.where(level1_menu_id: params[:level1_menu_id]).select("id,name")
    render json: level2_menu_list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_level3_menu
      @menu = Level3Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admins_level3_menu_params
      params.require(:level3_menu).permit(:level1_menu_id,:level2_menu_id,:name,:en_name,:show_type,:position, :link)
    end
end
