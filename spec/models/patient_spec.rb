require 'rails_helper'

RSpec.describe Patient, '#admin?' do
  it 'it should return true, when user is a admin' do 
    user = Patient.create(name: 'ABCD', password_digest:'XYZ', role: 'admin')
    isAdmin = user.admin?
    print 'Testing the admin user to be '
    puts isAdmin
    expect(isAdmin).to eq true
  end

  it 'it should return false, when user is not a admin' do 
    user = Patient.create(name: 'ABCD', password_digest:'XYZ', role: 'patient')
    isAdmin = user.admin?
    print 'Testing the patient user to be '
    puts isAdmin
    expect(isAdmin).to eq false
  end

  it 'it should return false, when user details are blank' do 
    user = Patient.create(name: '', password_digest:'', role: '')
    isAdmin = user.admin?
    print 'Testing the blank user to be '
    puts isAdmin
    expect(isAdmin).to eq false
  end

  it 'it should return false, when user role is null' do 
    user = Patient.create(name: '', password_digest:'')
    isAdmin = user.admin?
    print 'Testing the blank user to be '
    puts isAdmin
    expect(isAdmin).to eq false
  end
end
