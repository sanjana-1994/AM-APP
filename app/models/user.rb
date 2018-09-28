class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  def admin?
  	self.role == 'admin'
  end
  has_many :appointments
  has_many :doctors, through: :appointments
end
