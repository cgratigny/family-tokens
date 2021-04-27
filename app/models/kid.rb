class Kid < TenantRecord
  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date

  field :tokens_earned, type: Integer
  field :tokens_spent, type: Integer
  field :tokens_redeemed, type: Integer
  field :token_balance, type: Integer
  field :initial_token_balance, type: Integer

  has_many :time_logs

  before_save :update_tokens

  scope :chronological, -> { order(date_of_birth: :desc)}

  def update_tokens!
    self.update_tokens
    self.save!
  end

  def update_tokens
    self.tokens_earned = time_logs.where(activity: { '$in': Activity.earns.map{ |activity| activity.id.to_s } } ).sum(:tokens)
    self.tokens_spent = time_logs.where(activity: { '$in': Activity.spends.map{ |activity| activity.id.to_s } } ).sum(:tokens)
    self.token_balance = self.initial_token_balance.to_i + self.tokens_earned - self.tokens_spent
  end
end
