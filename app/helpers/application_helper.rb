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
end
