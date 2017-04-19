class Message < ApplicationRecord
  validates_presence_of :name,:tel_num,:email,:msg_type_id

end
