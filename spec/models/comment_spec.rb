require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name4@gmail.com",password: "123456") }
  let(:movie) { Movie.create!( user_id: user.id, release_date:"05/05/2023", Name:"Hari" ) }

  describe "validations" do
    it 'has a comment' do
      comments =Comment.new(
        comment:'',
        user_id: user.id,
        movie_id: movie.id
      )
      expect(comments).to_not be_valid

      comments.comment = 'Has a title'
      expect(comments).to be_valid
    end

    it 'has a user' do
      comments =Comment.new(
        comment:'good',
        user_id: '',
        movie_id: movie.id
      )
      expect(comments).to_not be_valid

      comments.user_id = user.id
      expect(comments).to be_valid
    end

    it 'has a movie' do
      comments =Comment.new(
        comment:'good',
        user_id: user.id,
        movie_id: ''
      )
      expect(comments).to_not be_valid

      comments. movie_id = movie.id
      expect(comments).to be_valid

    end

  end

end
