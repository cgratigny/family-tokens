class ApplicationController < ActionController::Base
  before_action :set_current_family
  helper_method :current_family
  around_action :set_time_zone, if: :current_family_present?

  def require_code!
    unless find_family_from_cookie.present? || current_family.present?
      redirect_to [:new, :family_code]
    end
  end

  def set_current_family
    Mongoid::Multitenancy.current_tenant = find_family_from_user || find_family_from_cookie
  end

  def find_family_from_cookie
    Family.where(session_code: cookies[:family_session_code]).first
  end

  def find_family_from_user
    current_user.family if user_signed_in?
  end

  def current_family
    Mongoid::Multitenancy.current_tenant
  end

  def current_family_present?
    current_family.present?
  end

  def set_time_zone(&block)
    Time.use_zone(current_family.current_time_zone, &block)
  end

end
