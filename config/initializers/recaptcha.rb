Recaptcha.configure do |config|
  # config.site_key  = Rails.application.credentials.recaptcha[:RECAPTCHA_SITE_KEY]
  # config.secret_key = Rails.application.credentials.recaptcha[:RECAPTCHA_SECRET_KEY]
  config.site_key = ENV['RECAPTCHA_PUBLIC_KEY']
  config.secret_key = ENV['RECAPTCHA_PRIVATE_KEY']
end