class Parents::KidsController < Parents::BaseController
  before_action :set_kid, only: %i[ show edit update destroy ]

  before_action :build_collection

  # GET /kids or /kids.json
  def index
  end

  # GET /kids/1 or /kids/1.json
  def show
  end

  # GET /kids/new
  def new
    @kid = Kid.new
  end

  # GET /kids/1/edit
  def edit
  end

  # POST /kids or /kids.json
  def create
    @kid = Kid.new(kid_params)

    respond_to do |format|
      if @kid.save
        format.html { redirect_to redirect_path, notice: "Upated #{@kid.to_s}" }
        format.json { render :show, status: :created, location: @kid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kids/1 or /kids/1.json
  def update
    respond_to do |format|
      if @kid.update(kid_params)
        format.html { redirect_to redirect_path, notice: "Upated #{@kid.to_s}" }
        format.json { render :show, status: :ok, location: @kid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1 or /kids/1.json
  def destroy
    @kid.destroy
    respond_to do |format|
      format.html { redirect_to [:parents, :kids], notice: "Kid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def build_redirect_path(args = {})
    [:parents, :kids]
  end

  private

  def build_collection
    @kids_grid = KidsGrid.new(grid_params)
  end

  def grid_params
    params[:kids_grid].present? ? params[:kids_grid].to_enum.to_h : {}
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_kid
    @kid = Kid.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :date_of_birth, :initial_token_balance)
  end
end
