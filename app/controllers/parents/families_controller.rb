class Parents::FamiliesController < Parents::BaseController
  before_action :set_admin_family, only: [:show, :edit, :update ]

  # GET /admin/families/1 or /admin/families/1.json
  def show
  end

  # GET /admin/families/1/edit
  def edit
  end

  def update
    respond_to do |format|
      if @family.update(permitted_params)
        format.html { redirect_to redirect_path, notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  def build_redirect_path(args = {})
    [:parents, :family]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_family
    @family = current_family
  end

  # Only allow a list of trusted parameters through.
  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username, kids_attributes: [:first_name, :last_name, :date_of_birth])
  end
end
