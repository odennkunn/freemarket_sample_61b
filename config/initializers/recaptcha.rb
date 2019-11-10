Recaptcha.configure do |config|
  config.PUBLIC_KEY  = Rails.application.credentials.recaptcha['RECAPTCHA_PUBLIC_KEY']
  config.PRIVATE_KEY = Rails.application.credentials.recaptcha['RECAPTCHA_PRIVATE_KEY']
end