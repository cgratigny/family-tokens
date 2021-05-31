class Parents::TimeLogsController < Parents::BaseController
  before_action :set_time_log, only: %i[ show edit update destroy ]

  before_action :build_collection

  # GET /time_logs or /time_logs.json
  def index
  end

  # GET /time_logs/1 or /time_logs/1.json
  def show
  end

  # GET /time_logs/new
  def new
    @time_log = TimeLog.new
  end

  # GET /time_logs/1/edit
  def edit
  end

  # POST /time_logs or /time_logs.json
  def create
    @time_log = TimeLog.new(time_log_params)

    respond_to do |format|
      if @time_log.save
        format.html { redirect_to redirect_path, notice: "Time log was successfully created." }
        format.json { render :show, status: :created, location: @time_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_logs/1 or /time_logs/1.json
  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html { redirect_to redirect_path, notice: "Time log was successfully updated." }
        format.json { render :show, status: :ok, location: @time_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_logs/1 or /time_logs/1.json
  def destroy
    @time_log.destroy
    respond_to do |format|
      format.html { redirect_to [:parents, :time_logs], notice: "Time log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def build_redirect_path(args = {})
    [:parents, :time_logs]
  end

  private

  def build_collection
    @time_logs_grid = TimeLogsGrid.new({ order: :starts_at, descending: true}.merge(grid_params)) do |scope|
      scope.page(params[:page]).per("50")
    end
  end

  def grid_params
    params[:time_logs_grid].present? ? params[:time_logs_grid].to_enum.to_h : {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_time_log
    @time_log = TimeLog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_log_params
    params.require(:time_log).permit(:kid_id, :activity_id, :starts_at, :stops_at)
  end
end
