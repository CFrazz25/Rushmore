require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "GET / routes to route to welcome index" do
    expect(:get => root_path).to route_to("welcome#index")
  end
end