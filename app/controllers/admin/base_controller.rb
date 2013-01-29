class Admin::BaseController < ApplicationController

  layout "admin"

  before_filter :authenticate

private

  def authenticate
    @@config ||= YAML::load_file("#{Rails.root}/config/credentials.yml")

    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == @@config['username'] && password == @@config['password']
      end
    end
  end

end
