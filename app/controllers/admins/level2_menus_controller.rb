class Admins::Level2MenusController < Admins::BaseController
  before_action :set_admins_level2_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level2_menus
  def index
    @admins_level2_menus = Admins::Level2Menu.all
  end

  # GET /admins/level2_menus/1
  def show
  end

  # GET /admins/level2_menus/new
  def new
    @admins_level2_menu = Admins::Level2Menu.new
  end

  # GET /admins/level2_menus/1/edit
  def edit
  end

  # POST /admins/level2_menus
  def create
    @admins_level2_menu = Admins::Level2Menu.new(admins_level2_menu_params)

    if @admins_level2_menu.save
      redirect_to @admins_level2_menu, notice: 'Level2 menu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level2_menus/1
  def update
    if @admins_level2_menu.update(admins_level2_menu_params)
      redirect_to @admins_level2_menu, notice: 'Level2 menu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admins/level2_menus/1
  def destroy
    @admins_level2_menu.destroy
    redirect_to admins_level2_menus_url, notice: 'Level2 menu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_level2_menu
      @admins_level2_menu = Admins::Level2Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admins_level2_menu_params
      params.require(:admins_level2_menu).permit(:name, :link)
    end
end
