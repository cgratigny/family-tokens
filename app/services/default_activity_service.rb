class DefaultActivityService < ApplicationService
  attr_accessor :family

  def perform
    default_activities.each do |key, activity_params|
      Activity.create!(activity_params.merge(family: self.family))
    end
  end

  def default_activities
    {
      activity1:
      {
        name: "Reading", token_duration: 60, token_affect: :earn, in_progress_name: "reading"
      },
      activity2:
      {
        name: "Outside", token_duration: 60, token_affect: :earn, in_progress_name: "outside"
      },
      activity3:
      {
        name: "Chores", token_duration: 60, token_affect: :earn, in_progress_name: "doing chores"
      },
      activity4:
      {
        name: "Screen", token_duration: 30, token_affect: :spend, in_progress_name: "on a screen"
      }
    }
  end

end
