class SignupStep < ClassyEnum::Base
  def last_step?
    false
  end
end

class SignupStep::Family < SignupStep
  def step_number
    1
  end
end

class SignupStep::Kid < SignupStep
  def step_number
    2
  end
end

class SignupStep::Activity < SignupStep
  def step_number
    3
  end

  def last_step?
    true
  end
end
