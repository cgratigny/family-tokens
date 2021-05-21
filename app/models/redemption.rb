class Redemption < TenantRecord
  include SpendableModule
  belongs_to :kid
  belongs_to :reward

  field :quantity, type: Integer
  field :fulfilled, type: Boolean
  field :tokens, type: Integer

  scope :unfulfilled, -> { where.not(fulfilled: true) }
  scope :fulfilled, -> { where.not(fulfilled: true) }

  def calculate_tokens
    reward.tokens * self.quantity
  end

end
