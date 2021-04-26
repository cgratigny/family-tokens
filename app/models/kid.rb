class Kid
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birth, type: Date
  field :tokens, type: Integer

  has_many :time_logs

  scope :chronological, -> { order(date_of_birth: :desc)}
end
