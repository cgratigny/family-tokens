class Family < ApplicationRecord
  field :name, type: String
  field :username, type: String
  field :code, type: String
  field :time_zone
  field :session_code, type: String

  validates_uniqueness_of :username

  before_save :set_session_code
  after_create :create_signup

  has_many :kids
  has_many :activities
  has_one :signup

  validates_presence_of :name, :code, :time_zone, if: :persisted?

  accepts_nested_attributes_for :kids
  accepts_nested_attributes_for :activities

  scope :by_username, -> (given_username) { where(username: given_username)}

  def self.generate_username(given_username, iteration = "")
    if by_username("#{given_username}#{iteration}").none?
      "#{given_username}#{iteration}"
    else
      generate_username(given_username, (iteration.to_i + 1))
    end
  end

  def signup_complete?
    self.name.present? && self.username.present? && self.code.present? && self.time_zone.present?
  end

  def switch_to!
     Mongoid::Multitenancy.current_tenant = self
   end

   def current_time_zone
     self.time_zone.present? ? self.time_zone : ActiveSupport::TimeZone::MAPPING["Pacific Time (US & Canada)"]
   end

   def set_session_code
     self.session_code = EncryptionService.encrypt(self.name) unless self.session_code.present?
   end

   def create_signup
     return if signup.present?
     Signup.create!(family: self)
   end

end
