class Activity < TenantRecord
  field :name, type: String
  field :in_progress_name, type: String
  field :token_duration, type: Integer
  field :token_affect, type: String
  field :disabled, type: Boolean

  classy_enum_attr :token_affect, enum: "TokenAffectOptions", allow_blank: true

  scope :earns, -> { where(token_affect: :earn) }
  scope :spends, -> { where(token_affect: :spend) }
  scope :enabled, -> { where.not(disabled: true)}

  has_many :time_logs

  def self.minute_range
    [["15 minutes", 15], ["1/2 hour", 30], ["1 hour", 60]]
  end

end
