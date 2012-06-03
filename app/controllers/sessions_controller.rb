class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:login] == Settings[:site_password]
      session[:login] = params[:login]
      redirect_to root_path
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
