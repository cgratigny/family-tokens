class Parents::ActivitySignupsController < Parents::BaseController
  include SignupControllerModule

  private

  def signup_step
    SignupStep::Activity.new
  end

  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username, activities_attributes: [:id, :name, :in_progress_name, :token_affect, :token_duration, :_destroy])
  end

end
