class Kid < TenantRecord
  field :first_name, type: String
  field :last_name, type: String, default: proc { family.name }
  field :date_of_birth, type: Date

  field :tokens_earned, type: Integer
  field :tokens_spent, type: Integer
  field :tokens_redeemed, type: Integer
  field :token_balance, type: Integer
  field :initial_token_balance, type: Integer
  field :tokens_redeemed, type: Integer

  validates_presence_of :first_name, :last_name, :date_of_birth

  has_many :time_logs
  has_many :redemptions

  before_save :update_tokens

  scope :chronological, -> { order(date_of_birth: :desc)}

  def to_s
    self.first_name
  end

  def rewards_available
    Reward.active.where({'tokens' => {'$lte' => self.token_balance}})
  end

  def update_tokens!
    self.update_tokens
    self.save!
  end

  def update_tokens
    self.tokens_earned = time_logs.where(activity: { '$in': Activity.earns.map{ |activity| activity.id.to_s } } ).sum(:tokens)
    self.tokens_spent = time_logs.where(activity: { '$in': Activity.spends.map{ |activity| activity.id.to_s } } ).sum(:tokens)
    self.tokens_redeemed = self.redemptions.sum(&:tokens)
    self.token_balance = self.initial_token_balance.to_i + self.tokens_earned - self.tokens_spent - self.tokens_redeemed
  end
end
