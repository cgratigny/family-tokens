class Admin::TimeLogsController < Admin::BaseController
  before_action :set_time_log, only: %i[ show edit update destroy ]

  # GET /time_logs or /time_logs.json
  def index
    @time_logs = TimeLog.all
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
        format.html { redirect_to @time_log, notice: "Time log was successfully created." }
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
        format.html { redirect_to @time_log, notice: "Time log was successfully updated." }
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
      format.html { redirect_to time_logs_url, notice: "Time log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_log
      @time_log = TimeLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_log_params
      params.fetch(:time_log, {})
    end
end
