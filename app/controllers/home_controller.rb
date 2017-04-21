class HomeController < BaseController
	
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
      # @errors = @message.errors.messages.keys.map(&:to_s).join(",")
      @errors = @message.errors.as_json(full_messages: true).to_json

      render :contact
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :tel_num, :email, :company,:msg_type_id, :content)
  end

end
