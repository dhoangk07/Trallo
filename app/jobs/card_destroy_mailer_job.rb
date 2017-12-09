class CardDestroyMailerJob < ApplicationJob
  queue_as :default

  def perform(description, user)
    UserMailer.notification_email(description, user).deliver
  end
end
