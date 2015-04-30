class UserMailer < ActionMailer::Base
  
  default from: "someone@example.com"


  def delete_email(user)
    @user = user
    mail(to: @user.email, subject: 'Goodbye')
  end
end
