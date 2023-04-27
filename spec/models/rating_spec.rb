require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name4@gmail.com",password: "123456") }
  let(:movie) { Movie.create!( user_id: user.id, release_date:"05/05/2023", Name:"Hari" ) }

  context "when validating attributes" do
    it "is valid with a movie_id and star value" do
      rating = Rating.create(movie_id: movie.id, star: 4)
      expect(rating).to be_valid
    end
  end
end
