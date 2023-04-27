require "rails_helper"

RSpec.describe RatingsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/movies/1/ratings").to route_to("ratings#create" , movie_id: "1")
    end
  end
end
