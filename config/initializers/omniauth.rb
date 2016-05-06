Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], 
   scope: 'public_profile, email', info_fields: 'email, first_name, last_name, gender, birthday'
end