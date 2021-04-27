class ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ClassyEnum::ActiveRecord
end
