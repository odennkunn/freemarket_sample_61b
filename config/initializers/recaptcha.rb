 Recaptcha.configure do |config|
  config.site_key  = credentials[:recaptcha][:RECAPTCHA_SITE_KEY]
  config.secret_key = credentials[:recaptcha][:RECAPTCHA_SECRET_KEY]
end

# +ENV['RECAPTCHA_PUBLIC_KEY']   = Rails.application.credentials.recaptcha[:site_key]
# +ENV['RECAPTCHA_PRIVATE_KEY'] = Rails.application.credentials.recaptcha[:secret_key]


