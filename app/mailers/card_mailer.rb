class CardMailer < ApplicationMailer
  default :from => "dhoanghvs@gmail.com"

  def notify_due_date(card)
  	@card = card
  	@user = card.user
  	mail(:to => @user.email, :subject => "Card due date")
  end
end