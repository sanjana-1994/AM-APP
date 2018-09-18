require 'rails_helper'

RSpec.describe AuthController, 'auth#create' do
  it "if user is present, it should redirect the page to root path" do
    user = Patient.create(name: 'ABCD', password_digest:'XYZ', role: 'admin')
    post :create,  {auth: { name: 'ABCD', password: 'XYZ' }}
    expect(response).to redirect_to(root_path)
  end
end
