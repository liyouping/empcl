class Level2Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  has_many :level3_menus,-> { order("position ASC") }, dependent: :destroy
  belongs_to :level1_menu,class_name: "Level1Menu"
  acts_as_list scope: :level1_menu
end
