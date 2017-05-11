class PagesController < BaseController
  # layout "header_and_footer"

  def show
    @page = Page.find(params[:id])
    @title = @page.title
  end

end
