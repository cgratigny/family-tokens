class RewardPresenter < ApplicationPresenter

  def name_with_tokens
    "#{@model.name} - #{@model.tokens} Tokens"
  end

end
