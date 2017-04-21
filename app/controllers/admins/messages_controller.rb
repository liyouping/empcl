class Admins::MessagesController < Admins::BaseController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order('created_at desc')
  end


  def show

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
