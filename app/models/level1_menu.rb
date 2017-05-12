class Level1Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  has_many :level2_menus,-> { order("position ASC") }, dependent: :destroy
  has_many :level3_menus,-> { order("position ASC") }, dependent: :destroy
  validates_presence_of :name,:en_name
  acts_as_list
end
