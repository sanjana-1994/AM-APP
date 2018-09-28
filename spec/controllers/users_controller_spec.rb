require 'rails_helper'

RSpec.describe UsersController, 'users#new & users#create' do
  context "When testing the UsersController class instance method new and create for valid case" do 
    it "if registeration page is accessed and data are all correct, if user is patient, it should redirect the page to search page" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template("new")
      expect(response).to be_successful
      post :create, :params =>{user: {name: "SanjuDas", password: "sanju", birth_date: "1994-09-21", gender: "female", email: "sanju@gmail.com", role: "patient"}}
      expect(response).to redirect_to(search_path)
    end
    it "if registeration page is accessed and data are all correct, if user is admin, it should redirect the page to root page" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template("new")
      expect(response).to be_successful
      post :create, :params =>{user: {name: "SanjuDas", password: "sanju", birth_date: "1994-09-21", gender: "female", email: "sanju@gmail.com", role: "admin"}}
      expect(response).to redirect_to(root_path)
    end   
  end
end

# RSpec.describe UsersController, 'users#create' do
#   context "When testing the UsersController class instance method create for invalid case" do 
#     it "if registeration page is accessed, it should redirect the page to registeration page" do
#       get :new
      
#     end  
#   end
# end
