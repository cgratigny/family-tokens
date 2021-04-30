class Parents::ActivitiesController < Parents::BaseController
  before_action :set_activity, only: %i[ show edit update destroy ]

  before_action :build_collection

  # GET /admin/activities or /admin/activities.json
  def index
  end

  # GET /admin/activities/1 or /admin/activities/1.json
  def show
  end

  # GET /admin/activities/new
  def new
    @activity = Activity.new
  end

  # GET /admin/activities/1/edit
  def edit
  end

  # POST /admin/activities or /admin/activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to [:parents, :activities], notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/activities/1 or /admin/activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to [:parents, :activities], notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/activities/1 or /admin/activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to admin_activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def build_collection
    @activities_grid = ActivitiesGrid.new(grid_params)
  end

  def grid_params
    params[:activities_grid].present? ? params[:activities_grid].to_enum.to_h : {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:name, :in_progress_name, :token_affect, :token_duration, :disabled)
  end
end
