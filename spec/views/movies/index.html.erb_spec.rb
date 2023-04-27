require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create!(First_name: "Example User",Last_name: "p",email: "name2@gmail.com",password: "123456") }
  before do
    sign_in user
  end
  before(:each) do
    assign(:movies, [
      Movie.create!(
        Sample_video: nil,
        Name: "Name",
        release_date: "05-05-2023",
        user_id: user.id
      ),
      Movie.create!(
        Sample_video: nil,
        Name: "Name",
        release_date: "05-05-2023",
        user_id: user.id
      )
    ])
  end

  it "renders a list of movies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
