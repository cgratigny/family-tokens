module SpendableModule
  extend ActiveSupport::Concern

  included do
    before_save :set_tokens
    after_save :update_kid_tokens

    validate :validate_kid_has_enough_tokens
  end

  def set_tokens
    self.tokens = self.calculate_tokens
  end

  def update_kid_tokens
    kid.reload.update_tokens_now!
  end

  private

  def validate_kid_has_enough_tokens
    return if persisted?
    if self.calculate_tokens.abs > kid.token_balance
      self.errors.add(:quantity, " error: kid only has #{kid.token_balance} tokens available.")
    end
  end

end
