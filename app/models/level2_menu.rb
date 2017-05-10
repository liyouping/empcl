class Level2Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  has_many :level3_menus, dependent: :destroy
  belongs_to :level1_menu
end
