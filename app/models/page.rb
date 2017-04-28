class Page < ApplicationRecord
  acts_as_paranoid  #假删除插件使用
end
