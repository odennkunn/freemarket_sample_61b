class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password ==ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
