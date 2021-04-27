class TenantRecord < ApplicationRecord
  include Mongoid::Multitenancy::Document
  tenant(:family)
end
