class Admin::FamiliesController < Admin::BaseController
  before_action :build_collection, only: :index

  # GET /admin/families/1 or /admin/families/1.json
  def show
  end

  def index

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
    [:edit, :parents, :family]
  end

  private

  def build_collection
    @families_grid = FamiliesGrid.new(grid_params)
  end

  def grid_params
    params[:activities_grid].present? ? params[:activities_grid].to_enum.to_h : {}
  end

  # Only allow a list of trusted parameters through.
  def permitted_params
    params.require(:family).permit(:name, :time_zone, :code, :username, :token_value, kids_attributes: [:first_name, :last_name, :date_of_birth])
  end
end
