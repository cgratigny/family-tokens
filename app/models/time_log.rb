class TimeLog
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :starts_at, type: Time
  field :stops_at, type: Time
  field :stop_now, type: Boolean

  belongs_to :kid
  belongs_to :activity

  before_create :set_starts_at
  before_save :set_stops_at

  scope :in_progress, -> { where(stops_at: nil) }
  scope :chronological, -> { order(starts_at: :desc) }

  def duration
    ((stops_at || Time.zone.now) - starts_at) / 1.minute
  end

  private

  def set_starts_at
    self.starts_at = Time.zone.now
  end

  def set_stops_at
    if self.stop_now.present?
      self.stops_at = Time.zone.now
    end
  end
end
