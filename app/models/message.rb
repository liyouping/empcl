class Message < ApplicationRecord
  belongs_to :msg_type
  validates_presence_of :name,:tel_num,:email,:content

  validates_each :msg_type_id do |record, attr, value|
    record.errors.add(attr,I18n.t("helpers.select.prompt")) if value.blank?
  end

end
