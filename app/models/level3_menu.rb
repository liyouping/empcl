class Level3Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  belongs_to :level1_menu
  belongs_to :level2_menu
end
