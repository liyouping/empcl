class Admins::Level3MenusController < Admins::BaseController
  before_action :set_admins_level3_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level3_menus
  def index
    @admins_level3_menus = Admins::Level3Menu.all
  end

  # GET /admins/level3_menus/1
  def show
  end

  # GET /admins/level3_menus/new
  def new
    @admins_level3_menu = Admins::Level3Menu.new
  end

  # GET /admins/level3_menus/1/edit
  def edit
  end

  # POST /admins/level3_menus
  def create
    @admins_level3_menu = Admins::Level3Menu.new(admins_level3_menu_params)

    if @admins_level3_menu.save
      redirect_to @admins_level3_menu, notice: 'Level3 menu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level3_menus/1
  def update
    if @admins_level3_menu.update(admins_level3_menu_params)
      redirect_to @admins_level3_menu, notice: 'Level3 menu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admins/level3_menus/1
  def destroy
    @admins_level3_menu.destroy
    redirect_to admins_level3_menus_url, notice: 'Level3 menu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_level3_menu
      @admins_level3_menu = Admins::Level3Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admins_level3_menu_params
      params.require(:admins_level3_menu).permit(:name, :link)
    end
end
