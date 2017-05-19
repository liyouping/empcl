class UserMailer < ApplicationMailer

  def send_msg_to_me(msg)
      @msg = msg
      to_list = Admin.all.collect{|a| "#{a.name} <#{a.email}>"}.join(",")
    mail(to: to_list,subject: "Empcl系统留言")

  end
end
