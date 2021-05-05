class Parents::RewardsController < Parents::BaseController
  before_action :set_reward, only: %i[ show edit update destroy ]

  before_action :build_collection

  # GET /rewards or /rewards.json
  def index
  end

  # GET /rewards/1 or /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to redirect_path, notice: "Reward was successfully created." }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to redirect_path, notice: "Reward was successfully updated." }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to [:parents, :rewards], notice: "Reward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def build_redirect_path(args = {})
    [:parents, :rewards]
  end

  private

  def build_collection
    @rewards_grid = RewardsGrid.new(grid_params)
  end

  def grid_params
    params[:rewards_grid].present? ? params[:rewards_grid].to_enum.to_h : {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reward
    @reward = Reward.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reward_params
    params.require(:reward).permit(:name, :tokens, :archived)
  end
end
