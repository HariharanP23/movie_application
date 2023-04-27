require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MoviesHelper. For example:
#
# describe MoviesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MoviesHelper, type: :helper do
    user = User.create!(First_name: "Example User",Last_name: "p",email: "name5@gmail.com",password: "123456")
    movie = Movie.new(
      user_id: user.id,
      release_date:05/05/2023,
      Name:"Hari"
    )

    it "assigns the creator to the movie" do
      result = helper.assign_movie_creator(movie, user)
      expect(result.user_id).to eq(user.id)
    end

    it "returns the updated movie" do
      result = helper.assign_movie_creator(movie, user)
      expect(result).to eq(movie)
    end
end
