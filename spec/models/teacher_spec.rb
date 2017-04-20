require 'rails_helper'

RSpec.describe Teacher, type: :model do

describe "Teacher attributes" do
  let(:teacher) { Teacher.new(name: "Mikey B", email: "mikeyb@gmail.com", password: "password") }

    it "has a name" do
      expect(teacher.name).to eq "Mikey B"
    end

    it "has an email address" do
      ecpect(teacher.email).to
    end

  end
end
