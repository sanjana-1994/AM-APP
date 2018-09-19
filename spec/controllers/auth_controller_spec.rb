require 'rails_helper'

RSpec.describe AuthController, 'auth#new' do
  context "When testing the AuthController class instance method new for valid case" do 
    it "if login page is accessed, it should redirect the page to login page" do
      get :new
      expect(login_path).to have_content(login_path)
      expect(response.status).to eq(200)
    end  
  end
end

RSpec.describe AuthController, 'auth#create & auth#destroy' do
  context "When testing the AuthController class instance method create and destroy for valid cases" do 
    it "if patient user is valid, it should redirect the page to search doctor page" do
      user = Patient.create(name: 'ABCD', password:'XYZ', role: 'patient')
      user.save
      post :create, :params =>{:auth =>{:name => "ABCD", :password => "XYZ"}}
      expect(response).to redirect_to(search_path)
      expect(session[:patient_id]).to eq user.id
      delete :destroy
      expect(response).to redirect_to(login_path)
      expect(session[:patient_id]).to eq nil
    end

    it "if admin user is valid, it should redirect the page to home page" do
      user = Patient.create(name: 'ABCD', password:'XYZ', role: 'admin')
      user.save
      post :create, :params =>{:auth =>{:name => "ABCD", :password => "XYZ"}}
      expect(response).to redirect_to(root_path)
      expect(session[:patient_id]).to eq user.id
      delete :destroy
      expect(session[:patient_id]).to eq nil
    end
  end
end

RSpec.describe AuthController, 'auth#create & auth#destroy' do
  context "When testing the AuthController class instance method create and destroy for invalid cases" do
    it "if user is not valid, it should redirect the page to login page" do
      user = Patient.create(name: 'ABCDE', password:'XYZ', role: 'admin')
      user.save
      post :create, :params =>{:auth =>{:name => "ABCD", :password => "XYZ"}}
      expect(response).to redirect_to(login_path)
      expect(session[:patient_id]).to eq nil
    end

    it "if user is blank, it should redirect the page to login page" do
      user = Patient.create(name: 'ABCDE', password:'XYZ', role: 'admin')
      user.save
      post :create, :params =>{:auth =>{:name => "", :password => ""}}
      expect(response).to redirect_to(login_path)
      expect(session[:patient_id]).to eq nil
    end
  end
end
