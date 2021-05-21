class Transaction < TenantRecord
  include SpendableModule

  belongs_to :kid

  field :amount, type: Money
  field :description, type: String
  field :tokens, type: Integer
  field :date, type: Date
  field :type, type: String

  classy_enum_attr :type, enum: "TransactionType", allow_blank: true

  scope :by_type, -> (given_type) { where(type: given_type.to_s)}

  def calculate_tokens
    return 0 unless self.type.affects_tokens?
    (self.amount.to_f / self.family.token_value * self.type.multiplier).round
  end

end
