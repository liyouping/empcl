module Admins::Level1MenusHelper
  def menu_show_type(show_type)
    if show_type == 0
      "中英文下都显示"
    elsif show_type == 1
      "只中文下显示"
    elsif show_type == 2
      "只英文下显示"
    end
  end
end
