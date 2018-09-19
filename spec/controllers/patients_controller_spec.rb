require 'rails_helper'

RSpec.describe PatientsController, 'patients#new' do
  context "When testing the PatientsController class instance method new for valid case" do 
    it "if registeration page is accessed, it should redirect the page to registeration page" do
      get :new
      expect(login_path).to have_content(login_path)
      expect(response.status).to eq(200)
    end  
  end
end

RSpec.describe PatientsController, 'patients#create' do
  context "When testing the PatientsController class instance method create for valid case" do 
    it "if registeration page is accessed, it should redirect the page to registeration page" do
      get :new
      post :create, :params =>{:name => 'Sanjana', :password => 'Sanjana', :birth_date , :gender, :role}
      expect(login_path).to have_content(login_path)
      expect(response.status).to eq(200)
    end  
  end
end
