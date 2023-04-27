require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name@gmail.com",password: "123456") }
  before do
    sign_in user
  end
  before(:each) do
    assign(:movie, Movie.new(
      Sample_video: nil,
      Name: "MyString",
      release_date:"05/05/2023",
      user: user
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[type=?][name=?]", "file", "movie[Sample_video]"
      assert_select "input[name=?]", "movie[Name]"
      assert_select "input[type=?][name=?]", "date", "movie[release_date]"
    end
  end
end
