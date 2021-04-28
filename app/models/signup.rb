class Signup < ApplicationRecord
  field :current_signup_step, type: String
  field :signup_progress, type: Hash, default: {}

  belongs_to :family

  classy_enum_attr :current_signup_step, enum: "SignupStep", default: SignupStep.first.to_s

  def complete?
    current_signup_step.last_step? && step_completed?(current_signup_step)
  end

  def percentage
    (current_signup_step.step_number.to_f / SignupStep.count.to_f) * 100
  end

  def step_completed?(signup_step)
    return unless self.signup_progress[signup_step.to_s].present?
    self.signup_progress[signup_step.to_s][:completed_at].present?
  end

  def complete_step!(signup_step)
    self.signup_progress = self.signup_progress.merge(signup_step.to_s => { completed_at: Time.zone.now })
    self.current_signup_step = SignupStep.reject{ |signup_step| self.step_completed?(signup_step) }.first
    self.save!
  end
end
