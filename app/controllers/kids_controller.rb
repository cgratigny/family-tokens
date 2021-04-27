class KidsController < ApplicationController
  before_action :require_code!

  # GET /kids or /kids.json
  def index
    @kids = Kid.all
  end

  # GET /kids/1 or /kids/1.json
  def show
  end

end
