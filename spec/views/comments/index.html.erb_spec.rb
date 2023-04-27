require 'rails_helper'
RSpec.describe "comments/index.html.erb", type: :view do
  before do
    user1 = User.create(First_name: "John", Last_name: "Doe", email: "johndoe@example.com", password: "password")
    user2 = User.create(First_name: "Jane", Last_name: "Doe", email: "janedoe@example.com", password: "password")
    movie1=Movie.create!( user_id: user1.id, release_date:"05/05/2023", Name:"Hari" )
    movie2=Movie.create!( user_id: user2.id, release_date:"05/04/2023", Name:"John" )
    Comment.create(user_id: user1.id,movie_id:movie1.id, comment: "This is the first comment.")
    Comment.create(user_id: user2.id,movie_id:movie2.id, comment: "This is the second comment.")
    assign(:comments, Comment.all)
    render partial: "comments/index", locals: { comments: assigns(:comments) }
  end

  it "renders a list of comments" do
    expect(rendered).to have_selector('div.row', count: 2)
    expect(rendered).to have_selector('img', count: 2)
    expect(rendered).to have_text('John')
    expect(rendered).to have_text('Jane')
    expect(rendered).to have_text('This is the first comment.')
    expect(rendered).to have_text('This is the second comment.')
  end
end

# RSpec.describe "comments/index", type: :view do
#   include Devise::Test::IntegrationHelpers
#
#   let(:user) { User.create!(First_name: "Example User", Last_name: "p", email: "name@gmail.com", password: "123456") }
#   let(:movie) { Movie.create(Name: "Test Movie", user_id: user.id) }
#
#   before do
#     sign_in user
#   end
#
#   before(:each) do
#     @comments = [
#       Comment.create!(
#         comment: "MyText",
#         movie: movie,
#         user: user
#       ),
#       Comment.create!(
#         comment: "MyText2",
#         movie: movie,
#         user: user
#       )
#     ]
#     assign(:comments, @comments)
#   end
#
#   it "renders a list of comments" do
#     render partial: 'comments/comment', collection: @comments, as: :comment
#     # expect(rendered).to have_selector('.comment', count: 2)
#
#
#     rendered_comments = Nokogiri::HTML(rendered).css('.comment')
#     expect(rendered_comments.length).to eq(2)
#   end
# end
