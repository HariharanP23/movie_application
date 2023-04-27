require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name@gmail.com",password: "123456") }

  let(:movie) {
    Movie.create!(
      Sample_video: nil,
      Name: "MyString",
      release_date: "05/05/2023",
      user: user.id
    )
  }
  before do
    sign_in user
  end

  before(:each) do
    assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(movie), "post" do

      assert_select "input[name=?]", "movie[Sample_video]"

      assert_select "input[name=?]", "movie[Name]"

      assert_select "input[name=?]", "movie[release_date]"

    end
  end
end
