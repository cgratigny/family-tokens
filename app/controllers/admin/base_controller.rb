class Admin::BaseController < ApplicationController

  before_action :authenticate_user!

  layout "admin"

  if ["production"].include?(Rails.env)
    before_action :http_auth
    def http_auth
      unless params[:controller].match(%r{\Aapi\/v1})
        authenticate_or_request_with_http_basic do |username, password|
          username == "parents" && password == "2007"
        end
      end
    end
  end

end
