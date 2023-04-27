require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name2@gmail.com",password: "123456") }

  before(:each) do
    assign(:movie, Movie.create!(
      Sample_video: nil,
      Name: "Names",
      release_date: "05-05-2023",
      user_id: user.id
    ))
  end
  before do
    sign_in user
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Names/)
    expect(rendered).to match('2023-05-05')
    expect(rendered).to match(/#{user.id}/)
  end
end
