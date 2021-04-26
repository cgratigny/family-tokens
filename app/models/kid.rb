class Kid
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date

  field :tokens_earned, type: Integer
  field :tokens_spent, type: Integer
  field :tokens_redeemed, type: Integer
  field :token_balance, type: Integer
  field :initial_token_balance, type: Integer

  has_many :time_logs

  scope :chronological, -> { order(date_of_birth: :desc)}

  def update_tokens!
    self.tokens_earned = time_logs.where(token_affect: :earn).sum(:tokens).abs
    self.tokens_spent = time_logs.where(token_affect: :spend).sum(:tokens).abs
    self.token_balance = (self.initial_token_balance || 0) + self.tokens_earned - self.tokens_spent
  end
end
