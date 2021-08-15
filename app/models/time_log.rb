class TimeLog < TenantRecord
  field :starts_at, type: Time
  field :stops_at, type: Time
  field :stop_now, type: Boolean
  field :redeemed, type: Boolean
  field :tokens, type: Float
  field :duration_minutes, type: Integer
  field :duration_type, type: String

  belongs_to :kid
  belongs_to :activity

  before_create :set_starts_at
  before_save :set_duration_minutes
  before_save :set_stops_at
  before_save :calculate_tokens
  after_save :update_kid_tokens

  scope :in_progress, -> { where(stops_at: nil) }
  scope :chronological, -> { order(starts_at: :desc) }

  classy_enum_attr :duration_type, enum: "DurationType", default: :time_range

  def set_duration_minutes
    return unless self.starts_at.present?
    self.duration_minutes = self.minutes
  end

  def duration
    ((stops_at || Time.zone.now) - starts_at)
  end

  def minutes
    self.duration_minutes = self.duration_type.calculate_minutes
  end

  def in_progress?
    self.duration_type.time_range? && self.stops_at.nil?
  end

  private

  def set_starts_at
    self.starts_at = Time.zone.now unless self.starts_at.present?
  end

  def set_stops_at
    if self.stop_now.present? && self.stops_at.nil?
      self.stops_at = Time.zone.now
    end
  end

  def calculate_tokens
    return unless self.starts_at.present? && self.stops_at.present?
    self.tokens = minutes.to_f / activity.token_duration.to_f
  end

  def update_kid_tokens
    kid.update_tokens!
  end

end
