Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
  				ENV["CLIENT_ID"], ENV["SECRET_KEY"],
  		   		scope: 'email', image_aspect_ratio: 'square', 
  		   		image_size: 48, access_type: 'online', name: 'google'

  OmniAuth.config.on_failure = Proc.new do |env|
  	SessionsController.action(:auth_failure).call(env)
  end
end