class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :password_confirmation,:old_password

  validates :email, uniqueness: true
  validates_presence_of :old_password,:password,:password_confirmation
  validates :password, length: { in: 6..20 }
  validates :password, confirmation: true
end
