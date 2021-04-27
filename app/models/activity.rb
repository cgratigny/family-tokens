class Activity < TenantRecord
  field :name, type: String
  field :in_progress_name, type: String
  field :token_duration, type: Integer
  field :token_affect, type: String

  classy_enum_attr :token_affect, enum: "TokenAffectOptions", allow_blank: true

  scope :earns, -> { where(token_affect: :earn) }
  scope :spends, -> { where(token_affect: :spend) }

  has_many :time_logs
end
