module SignupControllerModule
  extend ActiveSupport::Concern

  # this supports the shared view common/calendar/week_pager

  included do
    before_action :set_family_signup, only: %i[ show edit update ]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_family_signup
    @signup = current_family.signup
  end
end
