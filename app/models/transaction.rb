class Transaction < TenantRecord
  include SpendableModule

  belongs_to :kid
  belongs_to :transaction, optional: true

  field :amount, type: Money
  field :description, type: String
  field :tokens, type: Integer
  field :date, type: Date
  field :type, type: String
  field :balance_change, type: Money

  classy_enum_attr :type, enum: "TransactionType", allow_blank: true

  before_save :calculate_balance
  before_save :transfer_tokens

  scope :by_type, -> (given_type) { where(type: given_type.to_s)}

  def calculate_tokens
    return 0 unless self.type.affects_tokens?
    (self.amount.to_f / self.family.token_value * self.type.token_multiplier).round
  end

  def calculate_balance
    self.balance_change = (self.amount * self.type.balance_multiplier)
  end

  def amount_exceeding_money_balance
    self.amount - self.previous_amount - kid.money_balance
  end

  def previous_amount
    if self.amount_was.present?
      (self.amount_was["cents"] / 100).to_money
    else
      0.to_money
    end
  end

  def transfer_tokens
    return if self.type.transfer?
    if self.amount_exceeding_money_balance > 0 && (kid.tokens_to_money > self.amount_exceeding_money_balance)
      if self.transaction.present?
        transaction.update(amount: self.previous_amount + self.amount_exceeding_money_balance)
      else
        self.transaction = Transaction.create(
          amount: self.amount_exceeding_money_balance,
          type: :transfer,
          kid: self.kid,
          date: Time.zone.now.to_date,
          description: "Transfer to cover #{self.description}"
        )
      end

    end
  end

end
