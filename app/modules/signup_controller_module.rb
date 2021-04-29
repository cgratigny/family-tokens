module SignupControllerModule
  extend ActiveSupport::Concern

  included do
    before_action :set_family_signup, only: %i[ show edit update ]
    before_action :find_family
    helper_method :signup_step
  end

  def edit
  end

  def update
    respond_to do |format|
      if @family.update(permitted_params)
        complete_step!
        format.html { redirect_to redirect_path, notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete_step!
    current_family.signup.complete_step!(signup_step)
  end

  def build_redirect_path(args = {})
    [:edit, :parents, :signup]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_family_signup
    @signup = current_family.signup
  end

  def find_family
    @family = current_family
  end

end
