class SessionsController < ApplicationController

	def new
	end

	def create
		account = Account.find_by(email: params[:session][:email].downcase)
    	if account && account.password_digest == (params[:session][:password])
    	  sign_in account
    	  flash[:success] = "User logged in successfully."
    	  redirect_to home_path
    	else
    	  flash.now[:error] = 'Invalid email/password combination'
      	  render 'login'
    	end
	end

	def googleAuth
		begin
		    # Get access tokens from the google server
		    access_token = request.env["omniauth.auth"]
		    account = Account.from_omniauth(access_token)
		rescue
			flash[:error] = "There was an error while trying to authenticate you."
		end

	    # Access_token is used to authenticate request made from the rails application to the google server
	    account.google_token = access_token.credentials.token

	    # Refresh_token to request new access_token
	    # Note: Refresh_token is only sent once during the first request
	    refresh_token = access_token.credentials.refresh_token
	    account.google_refresh_token = refresh_token if refresh_token.present?

	    account.save
	    sign_in account
	    flash[:success] = "User account created using OAuth successful."
	   	redirect_to root_path
  	end

  	def auth_failure
	  redirect_to root_path
	end

	def destroy
		sign_out
		flash[:success] = "User logged out succesfully."
    	redirect_to root_url
	end

end