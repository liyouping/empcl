module ApplicationHelper

  def has_error(record,attr_name)
    record.errors[attr_name].blank? ? '' : 'has-error'
  end

  def error_msg(record,attr_name)

    if record.errors[attr_name].present?
      
    end
  end

  def fmt_date(date_str,fmt='%Y-%m-%d %H:%M:%S')
    date_str.strftime(fmt)
  end

  def will_paginate(collection, options={})
    content = ""

  end

  def msg_no_read_count
    Message.where(read_flag: "0").count
  end

  def no_result_show_helper(col, msg = "没有数据")
    "<tr><td colspan=\"#{col}\" class='ac'>#{msg}</td></tr>".html_safe
  end

  def msg_read_status(status)
    if status == "0"
      "<i class='fa fa-fw fa-eye-slash'></i>未阅".html_safe
    elsif status == "1"
      "<i class='fa fa-fw fa-eye'></i>已阅".html_safe
    end
  end
end
