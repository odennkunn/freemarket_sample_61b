#  Recaptcha.configure do |config|
#   config.site_key  = ENV["RECAPTCHA_SITE_KEY"]
#   config.secret_key = ENV["RECAPTCHA_SECRET_KEY"]
# end

+ENV['RECAPTCHA_SITE_KEY']   = Rails.application.credentials.recaptcha[:site_key]
+ENV['RECAPTCHA_SECRET_KEY'] = Rails.application.credentials.recaptcha[:secret_key]


