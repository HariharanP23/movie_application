# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/welcome_email
  def welcome_email
    UserMailer.with(user: User.last).welcome_email
  end

end
