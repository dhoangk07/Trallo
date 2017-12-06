class UserMailer < ApplicationMailer
  default :from => "dhoanghvs@gmail.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def notification_email(description, user)
    @description = description
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Card Destroyed.")
  end

  def notification_email_destroy_list(user, list)
    @list=list
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "List Destroyed.")
  end

  def comment_created(user, comment)
    @user = user
    @url  = "http://gmail.com/login"
    @comment = comment
    mail(:to => user.email, :subject => "Comment Created.")
  end

  def notification_welcome_member_invited_card(user, card)
    @card = card
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Welcome New Member.")
  end
end


