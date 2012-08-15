class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    if params[:login] == Settings[:site_password]
      session[:login] = params[:login]
      redirect_to session[:return_to]
    else
      flash.now[:error] = "Your password is wrong"
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
