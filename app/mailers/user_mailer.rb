class UserMailer < ApplicationMailer
  default :from => "dhoanghvs@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def notification_email(user)
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Card Destroyed.")
  end

  def comment_created(user, comment)
    @user = user
    @url  = "http://gmail.com/login"
    @comment = comment
    mail(:to => user.email, :subject => "Card Destroyed.")
  end
end


