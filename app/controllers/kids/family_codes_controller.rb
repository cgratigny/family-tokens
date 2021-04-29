class Kids::FamilyCodesController < Kids::BaseController
  # GET /family_codes/new
  def new
    if find_family_from_cookie.present?
      redirect_to root_url
    end
  end

  # POST /family_codes or /family_codes.json
  def create
    respond_to do |format|
      if code_valid?
        cookies[:family_session_code] = { value: find_family.session_code, expires: 1.year }
        format.html { redirect_to root_url, notice: "Family code correct!" }
        format.json { render :show, status: :created, location: @family_code }
      else
        format.html { render :new, alert: "Could not connect to family" }
        format.json { render json: @family_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    cookies.delete :family_session_code
    redirect_to root_url
  end

  def code_valid?
    return unless find_family.present?
    family_code_params[:code] == find_family.code
  end

  def find_family
    @family ||= Family.where(username: family_code_params[:username].downcase).first
  end

  private

    # Only allow a list of trusted parameters through.
    def family_code_params
      params.require(:family).permit(:code, :username)
    end
end
