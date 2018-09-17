class Patient < ApplicationRecord
  has_secure_password
  def admin?
  	self.role == 'admin'
  end
  has_many :appointments
  has_many :doctors, through: :appointments
end
