class Parents::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :force_setup

  layout "parents"

  def force_setup
    return if current_family.signup.complete?
    return if controller_name.include?("signups") || !request.get?
    redirect_to [:edit, :parents, :signup] unless current_user.family.signup.complete?
  end

end
