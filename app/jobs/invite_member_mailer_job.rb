class InviteMemberMailerJob < ApplicationJob
  queue_as :default

  def perform(user, card)
   UserMailer.notification_welcome_member_invited_card(user, card).deliver
  end
end
