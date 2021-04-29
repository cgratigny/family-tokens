class Parents::SignupsController < Parents::BaseController
  include SignupControllerModule

  def edit
    if current_family.signup.complete?
      redirect_to [:parents]
    else
      redirect_to [:edit, :parents, "#{@signup.current_signup_step}_signup"]
    end
  end
end
