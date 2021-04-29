class ApplicationRecord
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ClassyEnum::ActiveRecord
  include Mongoid::History::Trackable

  def presenter
  @presenter ||= "#{self.class.name}Presenter".constantize.new(self)
  end

  def decorator
    @decorator ||= "#{self.class.name}Decorator".constantize.new(self)
  end

end
