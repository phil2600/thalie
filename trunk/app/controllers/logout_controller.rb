class LogoutController < ApplicationController
  def index
    RAILS_DEFAULT_LOGGER.debug("Logout")
    
    authenticate_or_request_with_http_basic("Enter an email and a pass") do |name, pass|
      @user = Member.auth(name, pass)
      session[:user] = @user
    end
    redirect_to root_url
  end
end
