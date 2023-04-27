require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name4@gmail.com",password: "123456") }



  describe "validations" do
    it 'has a Name' do
      movie =Movie.new(
        user_id: user.id,
        release_date:"05/05/2023",
        Name:''
      )
      expect(movie).to_not be_valid

      movie.Name = 'Has a title'
      expect(movie).to be_valid
    end

    it 'has a user' do
      movie =Movie.new(
        user_id: '',
        release_date:"05/05/2023",
        Name:'Hari'
      )
      expect(movie).to_not be_valid

      movie.user_id = user.id
      expect(movie).to be_valid
    end

    it 'has a release_date' do
      movie =Movie.new(
        user_id: user.id,
        release_date:'',
        Name:'Hari'
      )
      expect(movie).to_not be_valid

      movie.release_date = '05/05/2023'
      expect(movie).to be_valid
    end
  end
end
