require 'rails_helper'

# RSpec.describe TeachersController, type: :controller do

describe TeachersController do
  let!(:teacher) { Teacher.create!(name: "Mikey B", email: "mikeyb@gmail.com", password: "password") }

  describe "POST #create" do
    it "redirects to home page" do
      teacher = Teacher.create(name: "Test Person", email: "testperson@gmail.com", password: "password")

      post :create, {:teacher => {name: "Test Person", email: "testperson@gmail.com", password: "password"} }
      expect(response).to have_http_status 200
    end
  end

  describe 'GET #show' do
    it "redirects to the User's profile page" do
      get :show, { id: teacher.id }
      expect(response).to render_template(:show)
    end
  end


end
