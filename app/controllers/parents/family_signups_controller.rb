class Parents::FamilySignupsController < Parents::BaseController
  include SignupControllerModule

  private

  def signup_step
    SignupStep::Family.new
  end

  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username, kids_attributes: [:first_name, :last_name, :date_of_birth])
  end

end
