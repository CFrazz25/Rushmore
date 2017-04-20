require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  # let(:teacher) { Teacher.new(name: "Mikey B", email: "mikeyb@gmail.com", password: "password") }



  describe "POST #create" do
    it "redirects to home page" do
      teacher = Teacher.create(name: "Test Person", email: "testperson@gmail.com", password: "password")

      post :create, {:teacher => {name: "Test Person", email: "testperson@gmail.com", password: "password"} }
      expect(response).to have_http_status 200
    end
  end


end
