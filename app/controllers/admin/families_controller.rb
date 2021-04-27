class Admin::FamiliesController < Admin::BaseController
  before_action :set_admin_family, only: [:show, :edit, :update ]

  # GET /admin/families/1 or /admin/families/1.json
  def show
  end

  # GET /admin/families/1/edit
  def edit
  end

  # PATCH/PUT /admin/families/1 or /admin/families/1.json
  def update
    respond_to do |format|
      if @family.update(permitted_params)
        format.html { redirect_to [:admin, :family], notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_family
    @family = current_family
  end

  # Only allow a list of trusted parameters through.
  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username)
  end
end
