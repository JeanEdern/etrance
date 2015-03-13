require "subscribe_to_newsletter"

class SubscribersController < ApplicationController
  skip_before_filter :authenticate_user!

  def create
    begin
      SubscribeToNewsletter.new.run(params[:email])

      flash[:notice] = "Merci, vous recevrez en avant-première nos invitations!"
    rescue Gibbon::MailChimpError => exception
      flash[:alert] = "Unable to subscribe to the newsletter: #{exception.message}"
    end
    redirect_to root_path
  end
end