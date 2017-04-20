require 'rails_helper'

RSpec.describe SessionsController, type: :controller do 

  describe "Login" do 

    before do
      session[:teacher_id] = nil
    end

  it 'creates a session id' do
    post :create, {email: "teacher@example.com", password: "poop"}

    expect(response).to have_http_status(:created)
  end



    it 'session[teacher_id] should equal teacher.id' do
      teacher = Teacher.create(
          name: "Brendan",
          email: "teacher@example.com", 
          password: "poop")
        post :create, { email: "teacher@example.com", password: "poop"} 
        expect(session[:teacher_id]).to eq(teacher.id)
    end
  end
end
