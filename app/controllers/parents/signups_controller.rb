class Parents::SignupsController < Parents::BaseController
  include SignupControllerModule

  def edit
    redirect_to [:edit, :parents, "#{@signup.current_signup_step}_signup", return_path: url_for([:edit, :parents, "#{@signup.current_signup_step}_signup"])]
  end
end
