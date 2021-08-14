class DurationType < ClassyEnum::Base
end

class DurationType::Manual < DurationType
  def calculate_minutes
    self.owner.duration_minutes
  end
end

class DurationType::TimeRange < DurationType
  def calculate_minutes
    (self.owner.duration / 1.minute).round
  end
end
