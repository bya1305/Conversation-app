class WelcomeController < ApplicationController
  def landing
    if user_signed_in?
      redirect_to '/home'
    end
  end

  def home
    @user = current_user
    @conversations = Conversation.all
  end
end
