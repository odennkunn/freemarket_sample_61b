Recaptcha.configure do |config|
  config.public_key  = Rails.application.credentials.recaptcha['RECAPTCHA_PUBLIC_KEY']
  config.private_key = Rails.application.credentials.recaptcha['RECAPTCHA_PRIVATE_KEY']
end