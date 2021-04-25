class Activity
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String

  embeds_many :time_logs
end
