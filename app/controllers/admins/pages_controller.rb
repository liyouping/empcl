class Admins::PagesController < Admins::BaseController
  def index
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def show
  end

  private
  def set_page
    @page = Page.find(params[:id])
  end
  def page_params
    params.require(:page).permit(:title, :content)
  end
end
