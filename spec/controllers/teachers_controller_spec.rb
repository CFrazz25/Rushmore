require 'rails_helper'

RSpec.describe Teacher, type: :controller do

describe "Teacher attributes" do
  let(:teacher) { Teacher.new(name: "Mikey B", email: "mikeyb@gmail.com", password: "password") }

  # describe "POST #create" do
  #   context "when valid params are passed" do
  #     it "redirects to home page" do
  #       post :create, { teacher: { name: "Test Person", email: "testperson@gmail.com", password: "password" } }
  #       expect(response).to redirect_to students_path
  #     end
  #   end
  # end


  end
end
