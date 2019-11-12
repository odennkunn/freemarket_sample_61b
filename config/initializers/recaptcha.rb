 Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.aws[:site_key]
  config.secret_key = Rails.application.credentials.aws[:secret_key]
end

# +ENV['RECAPTCHA_SITE_KEY']   = Rails.application.credentials.recaptcha[:site_key]
# +ENV['RECAPTCHA_SECRET_KEY'] = Rails.application.credentials.recaptcha[:secret_key]
