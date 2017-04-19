class HomeController < ApplicationController
	
  def index
  	@select_menu = "home"
  end

  def contact
  	@select_menu = "contact"
    @message = Message.new
  end

  def send_msg
    @message = Message.new message_params
    if @message.valid?
      if @message.save
        flash[:notice] = t(:contact_success)
      end
      redirect_to action: 'contact'
    else
      render :contact
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :tel_num, :email, :company,:msg_type_id, :content)
  end

end
