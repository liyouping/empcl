class Level1Menu < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
  has_many :level2_menus, dependent: :destroy
  has_many :level3_menus, dependent: :destroy
end
