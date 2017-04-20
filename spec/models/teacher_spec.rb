require 'rails_helper'

RSpec.describe Teacher, type: :model do

describe "Teacher attributes" do
  let(:teacher) { Teacher.new(name: "Mikey B", email: "mikeyb@gmail.com", password: "password") }

    it "has a name" do
      expect(teacher.name).to eq "Mikey B"
    end

    it "has an email address" do
      expect(teacher.email).to include("@")
    end

    it "has a password"do
      expect(teacher.password).to be_a(BCrypt::Password)
    end

  end
end
