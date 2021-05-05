class KidPresenter < ApplicationPresenter

  def name_with_token_balance
    "#{@model.first_name} - #{@model.token_balance} Tokens Available"
  end

end
