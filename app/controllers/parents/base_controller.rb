class Parents::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :force_setup

  helper_method :signup_incomplete?
  helper_method :signup_complete?

  layout "parents"

  def page_title
    class_name = self.class.name.split('::').last.gsub("Controller", "").underscore
    I18n.t("titles.#{class_name}", default: class_name.titleize)

  end

  def force_setup
    return unless signup_incomplete?
    redirect_to [:edit, :parents, :signup] unless current_user.family.signup.complete?
  end

  def signup_complete?
    return true if current_family.signup.complete?
    !signup_incomplete?
  end

  def signup_incomplete?
    return false if current_family.signup.complete?
    return false if controller_name.include?("signups") || !request.get?
    true
  end

end
