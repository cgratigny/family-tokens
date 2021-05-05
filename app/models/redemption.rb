class Redemption < TenantRecord
  belongs_to :kid
  belongs_to :reward

  field :quantity, type: Integer
  field :fulfilled, type: Boolean
  field :tokens, type: Integer

  before_save :set_tokens
  after_save :update_kid_tokens

  validate :validate_kid_has_enough_tokens

  scope :unfulfilled, -> { where.not(fulfilled: true) }
  scope :fulfilled, -> { where.not(fulfilled: true) }

  def set_tokens
    self.tokens = self.calculate_tokens
  end

  def calculate_tokens
    reward.tokens * self.quantity
  end

  def update_kid_tokens
    kid.update_tokens!
  end

  private

  def validate_kid_has_enough_tokens
    return if persisted?
    if self.calculate_tokens > kid.token_balance
      self.errors.add(:quantity, " error: kid only has #{kid.token_balance} tokens available.")
    end
  end
end
