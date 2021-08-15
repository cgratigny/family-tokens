class TimeLogsGrid < ApplicationGrid

  scope do
    TimeLog.all
  end

  def row_class(asset)
    asset.in_progress? ? "text-success font-weight-bold" : ""
  end

  column(:kid_name) do |model|
    model.kid.first_name
  end

  column(:activity) do |model|
    model.activity.name
  end

  column(:minutes) do |model|
    model.minutes
  end

  column(:tokens) do |model|
    "#{model.activity.token_affect.symbol}#{model.tokens.try(:round, 2)}"
  end

  column(:details, header: "Details", html: true) do |model|
    render partial: "parents/time_logs/columns/details_#{model.duration_type}", locals: { time_log: model }
  end

  column(:created_at, html: false)

  column(:links, header: "", html: true) do |model|
    render partial: "parents/time_logs/columns/links", locals: { time_log: model }
  end

  def no_records_message
    "You don't have any time entries yet! Head over to the token tracker to start tracking your child's time. Or, you can create a time here."
  end

end
