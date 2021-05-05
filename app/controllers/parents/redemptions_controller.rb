class Parents::RedemptionsController < Parents::BaseController
  before_action :set_redemption, only: %i[ show edit update destroy ]

  before_action :build_collection

  # GET /redemptions or /redemptions.json
  def index
  end

  # GET /redemptions/1 or /redemptions/1.json
  def show
  end

  # GET /redemptions/new
  def new
    @redemption = Redemption.new
  end

  # GET /redemptions/1/edit
  def edit
  end

  # POST /redemptions or /redemptions.json
  def create
    @redemption = Redemption.new(redemption_params)

    respond_to do |format|
      if @redemption.save
        format.html { redirect_to redirect_path, notice: "Redemption was successfully created." }
        format.json { render :show, status: :created, location: @redemption }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redemptions/1 or /redemptions/1.json
  def update
    respond_to do |format|
      if @redemption.update(redemption_params)
        format.html { redirect_to redirect_path, notice: "Redemption was successfully updated." }
        format.json { render :show, status: :ok, location: @redemption }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redemptions/1 or /redemptions/1.json
  def destroy
    @redemption.destroy
    respond_to do |format|
      format.html { redirect_to [:parents, :redemptions], notice: "Redemption was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def build_redirect_path(args = {})
    [:parents, :redemptions]
  end

  private

  def build_collection
    @redemptions_grid = RedemptionsGrid.new(grid_params)
  end

  def grid_params
    params[:redemptions_grid].present? ? params[:redemptions_grid].to_enum.to_h : {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_redemption
    @redemption = Redemption.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def redemption_params
    params.require(:redemption).permit(:kid_id, :reward_id, :quantity, :fulfilled)
  end
end
