require 'rails_helper'

RSpec.describe User, '#admin?' do
  context "When testing the User class instance method admin? for valid cases" do 
    it 'it should return true, when user is a admin' do 
      user = User.create(name: 'ABCD', password_digest:'XYZ', role: 'admin')
      isAdmin = user.admin?
      expect(isAdmin).to eq true
    end
  end
end

RSpec.describe User, '#admin?' do
  context "When testing the User class instance method admin? for invalid cases" do 
    it 'it should return false, when user is not a admin' do 
      user = User.create(name: 'ABCD', password_digest:'XYZ', role: 'user')
      isAdmin = user.admin?
      expect(isAdmin).to eq false
    end

    it 'it should return false, when user details are blank' do 
      user = User.create(name: '', password_digest:'', role: '')
      isAdmin = user.admin?
      expect(isAdmin).to eq false
    end

    it 'it should return false, when user role is null' do 
      user = User.create(name: '', password_digest:'')
      isAdmin = user.admin?
      expect(isAdmin).to eq false
    end
  end
end