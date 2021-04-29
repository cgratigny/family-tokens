class WelcomesController < ApplicationController
  def show
    if user_signed_in?
      redirect_to [:parents]
    end
  end

  def authenticate_user!
    true
  end

end
