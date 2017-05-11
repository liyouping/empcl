class Admins::Level1MenusController < Admins::BaseController
  before_action :set_level1_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level1_menus
  def index
    @menus = Level1Menu.all.order('position asc').page(params[:page] || 1).per(10)
  end

  # GET /admins/level1_menus/1
  def show
  end

  # GET /admins/level1_menus/new
  def new
    @menu = Level1Menu.new
  end

  # GET /admins/level1_menus/1/edit
  def edit
  end

  # POST /admins/level1_menus
  def create
    @menu = Level1Menu.new(menu_params)

    if @menu.save
      redirect_to admins_level1_menus_path, notice: '一级菜单创建成功!'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level1_menus/1
  def update
    if @menu.update(menu_params)
      redirect_to admins_level1_menus_path, notice: '一级菜单更新成功!'
    else
      render :edit
    end
  end

  # DELETE /admins/level1_menus/1
  def destroy
    @menu.destroy
    redirect_to admins_level1_menus_url, notice: '一级菜单删除成功!'
  end

  def move_position
    menu = Level1Menu.find(params[:id])
    notice = ''
    case params[:type]
      when 'pre'
        menu.move_higher
        notice = '一级菜单上移成功!'
      when 'next'
        menu.move_lower
        notice = '一级菜单下移成功!'
      when 'first'
        menu.move_to_top
        notice = '一级菜单置顶成功!'
      when 'last'
        menu.move_to_bottom
        notice = '一级菜单置底成功!'
    end
    redirect_to admins_level1_menus_path, notice: notice

  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_level1_menu
      @menu = Level1Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:name,:en_name,:show_type,:position, :link)
    end
end
