class SessionsController < ApplicationController
  def new
<<<<<<< HEAD
=======
    session[:return_to] ||= request.referer
>>>>>>> c9d1371d0b302e38beed27b4c85dabed8d8588ed
  end

  def create
    if params[:login] == Settings[:site_password]
      session[:login] = params[:login]
<<<<<<< HEAD
      redirect_to root_path
=======
      redirect_to session[:return_to]
>>>>>>> c9d1371d0b302e38beed27b4c85dabed8d8588ed
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
