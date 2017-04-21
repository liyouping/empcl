class MsgType < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :name,:en_name
  validates_presence_of :name,:en_name
end
