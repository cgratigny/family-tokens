class Parents::KidSignupsController < Parents::BaseController
  include SignupControllerModule

  private

  def signup_step
    SignupStep::Kid.new
  end

  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username, kids_attributes: [:id, :first_name, :last_name, :date_of_birth, :_destroy])
  end
end
