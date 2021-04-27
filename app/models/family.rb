class Family < ApplicationRecord
  field :name, type: String
  field :username, type: String
  field :code, type: String
  field :time_zone
  field :session_code, type: String

  validates_uniqueness_of :name
  before_save :set_session_code

  def switch_to!
     Mongoid::Multitenancy.current_tenant = self
   end

   def current_time_zone
     self.time_zone.present? ? self.time_zone : ActiveSupport::TimeZone::MAPPING["Pacific Time (US & Canada)"]
   end

   def set_session_code
     self.session_code = EncryptionService.encrypt(self.name) unless self.session_code.present?
   end
end
