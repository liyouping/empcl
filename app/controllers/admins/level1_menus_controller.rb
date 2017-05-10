class Admins::Level1MenusController < Admins::BaseController
  before_action :set_level1_menu, only: [:show, :edit, :update, :destroy]

  # GET /admins/level1_menus
  def index
    @level1_menus = Admins::Level1Menu.all
  end

  # GET /admins/level1_menus/1
  def show
  end

  # GET /admins/level1_menus/new
  def new
    @level1_menu = Admins::Level1Menu.new
  end

  # GET /admins/level1_menus/1/edit
  def edit
  end

  # POST /admins/level1_menus
  def create
    @level1_menu = Admins::Level1Menu.new(level1_menu_params)

    if @level1_menu.save
      redirect_to @level1_menu, notice: 'Level1 menu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/level1_menus/1
  def update
    if @level1_menu.update(level1_menu_params)
      redirect_to @level1_menu, notice: 'Level1 menu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admins/level1_menus/1
  def destroy
    @level1_menu.destroy
    redirect_to admins_level1_menus_url, notice: 'Level1 menu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level1_menu
      @level1_menu = Admins::Level1Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def level1_menu_params
      params.require(:level1_menu).permit(:name, :link)
    end
end
