class Admins::PagesController < Admins::BaseController
  include ApplicationHelper
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token,only: :upload_img
  def index
    @pages = Page.all.order('created_at desc').page(params[:page] || 1).per(10)
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

  def destroy
    respond_to do |format|
      if  @page.destroy
        format.html { redirect_to admins_pages_path, notice: '页面删除成功！' }
        format.json { head :no_content }
      else
        format.html { redirect_to admins_pages_path, error: '页面删除失败！' }
        format.json { head :no_content }
      end
    end
  end

  def upload_img
    if request.post?
      pp params[:img]
      file_path = UploadedFileUtils.save_uploaded_file(params[:img])
      render text: root_url+file_path
    end

  end

  private
  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :content,:en_title,:en_content)
  end
end
