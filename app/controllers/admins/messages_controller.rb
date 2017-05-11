class Admins::MessagesController < Admins::BaseController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order('created_at desc').page(params[:page] || 1).per(10)
  end


  def show
   @message.update read_flag: true
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def set_message
    @message = Message.find(params[:id])
  end


  def message_params
    params.require(:message).permit(:name, :en_name)
  end
end
