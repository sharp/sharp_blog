class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  protected

  def login_required
    redirect_to root_path unless session[:login] 
  end
end
