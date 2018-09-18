require 'rails_helper'

RSpec.describe AuthController, 'auth#create' do
  it "if user is present, it should redirect the page to root path" do
    puts "Testing authentication of valid user "
    user = Patient.create(name: 'ABCD', password:'XYZ', role: 'admin')
    user.save
    post :create, :params =>{:auth =>{:name => "ABCD", :password => "XYZ"}}
    expect(response).to redirect_to(root_path)
  end

  it "if user is not present, it should redirect the page to login path" do
    puts "Testing authentication of invalid user "
    user = Patient.create(name: 'ABCDE', password:'XYZ', role: 'admin')
    user.save
    post :create, :params =>{:auth =>{:name => "ABCD", :password => "XYZ"}}
    expect(response).to redirect_to(login_path)
  end

  it "if user is blank, it should redirect the page to login path" do
    puts "Testing authentication of invalid blank user "
    user = Patient.create(name: 'ABCDE', password:'XYZ', role: 'admin')
    user.save
    post :create, :params =>{:auth =>{:name => "", :password => ""}}
    expect(response).to redirect_to(login_path)
  end
end
