# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  # Use default layout.
  layout 'default'
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9b6ca872eda61605bf8437cee3f09b0c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  private 
  def authentificate
    authenticate_or_request_with_http_basic("Enter an email and a pass") do |name, pass|
      @user = Member.auth(name, pass)
      session[:user] = @user
    end
  end
  
end
