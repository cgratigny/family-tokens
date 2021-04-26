class ApplicationController < ActionController::Base

  if ["alpha", "beta", "production"].include?(Rails.env)
    before_action :http_auth
    def http_auth
      unless params[:controller].match(%r{\Aapi\/v1})
        authenticate_or_request_with_http_basic do |username, password|
          username == "gratigny" && password == "2879"
        end
      end
    end
  end

end
