class Activity
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :in_progress_name, type: String

  has_many :time_logs
end
