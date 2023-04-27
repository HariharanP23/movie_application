require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/movies/1/comments").to route_to("comments#create", movie_id: "1")
    end

  end
end
