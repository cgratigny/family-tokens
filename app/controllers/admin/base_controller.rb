class Admin::BaseController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def authenticate_user!
    super
    raise Pundit::NotAuthorizedError unless current_user.super_admin?
  end

end
