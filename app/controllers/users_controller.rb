class UsersController < Devise::OmniauthCallbacksController

  def show
  end

  def github
    omniauth = request.env["omniauth.auth"]
    puts "############# #{omniauth.inspect}"
    @user = User.find_by_github_uid("#{omniauth['uid']}") || User.create_from_omniauth(omniauth)
    cookies.permanent[:token] = @user.github_username
    if @user.persisted?
      sign_in @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    redirect_to root_url
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end
end
