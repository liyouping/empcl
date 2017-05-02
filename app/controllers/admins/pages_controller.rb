class Admins::PagesController < Admins::BaseController
  include ApplicationHelper
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  def index
    @pages = Page.all.order('created_at desc').page(1).per(10)
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admins_pages_path, notice: '页面创建成功！' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admins_pages_path, notice: '页面修改成功！' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content,:en_title,:en_content)
  end
end
