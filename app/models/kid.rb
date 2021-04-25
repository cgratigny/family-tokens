class Kid
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :first_name, type: String
  field :last_name, type: String

  embeds_many :time_logs
end
