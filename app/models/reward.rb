class Reward < TenantRecord
  field :tokens, type: Integer
  field :name, type: String
  field :archived, type: Boolean

  scope :active, -> { where.not(archived: true) }

  def to_s
    self.name
  end

end
