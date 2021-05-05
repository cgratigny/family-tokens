class TenantRecord < ApplicationRecord
  include Mongoid::Multitenancy::Document
  tenant(:family)

  belongs_to :family
end
