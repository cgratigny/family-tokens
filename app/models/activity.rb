class Activity
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ClassyEnum::ActiveRecord

  field :name, type: String
  field :in_progress_name, type: String
  field :token_duration, type: Integer
  field :token_affect, type: String

  classy_enum_attr :token_affect, enum: "TokenAffectOptions", allow_blank: true

  has_many :time_logs
end
