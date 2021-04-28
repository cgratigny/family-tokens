class Parents::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :force_setup

  layout "parents"

  def force_setup
    return if controller_name.include?("signups") || !request.get?
    redirect_to [:edit, :parents, :signup] unless current_user.family.signup.complete?
  end

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
