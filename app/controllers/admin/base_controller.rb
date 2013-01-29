class Admin::BaseController < ApplicationController

  layout "admin"

  before_filter :authenticate

private

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == "dalemlapowke.123"
      end
    end
  end

end
