class TimeLog
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :activity
  field :starts_at, type: DateTime
  field :stops_at, type: DateTime

  embedded_in :activity
  embedded_in :kid
end
