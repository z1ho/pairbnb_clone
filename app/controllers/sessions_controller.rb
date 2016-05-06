class SessionsController < ApplicationController

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    #if the user exists and has been 'authenticated', send to root_url and push message "Signed In!"
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
    #else, create the new user
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = root_url   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end 

  def url_after_create
    static_home_path
  end
end
