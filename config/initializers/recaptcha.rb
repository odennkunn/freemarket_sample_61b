 Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.dig(:recaptcha_site_key)
  # config.site_key  = ENV["RECAPTCHA_SITE_KEY"]
  config.secret_key  = Rails.application.credentials.dig(:recaptcha_secret_key)
  # config.secret_key = ENV["RECAPTCHA_SECRET_KEY"]
end

# +ENV['RECAPTCHA_PUBLIC_KEY']   = Rails.application.credentials.recaptcha[:site_key]
# +ENV['RECAPTCHA_PRIVATE_KEY'] = Rails.application.credentials.recaptcha[:secret_key]


