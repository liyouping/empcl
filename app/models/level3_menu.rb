class Level3Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  belongs_to :level1_menu
  belongs_to :level2_menu
  acts_as_list scope: :level2_menu
  validates_presence_of :name,:en_name,:level1_menu_id,:level2_menu_id
end
