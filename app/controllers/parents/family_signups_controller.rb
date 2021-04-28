class Parents::FamilySignupsController < Parents::BaseController
  include SignupControllerModule

  before_action :find_family

  def edit
    if current_family.signup_complete?
      current_family.signup.complete_step!(signup_step)
    end
  end

  private

  def signup_step
    SignupStep::Family.new
  end

  def find_family
    @family = current_family
  end

end
