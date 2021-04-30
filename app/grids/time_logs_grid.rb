class TimeLogsGrid < ApplicationGrid

  scope do
    TimeLog.all
  end

  column(:kid_name) do |model|
    model.kid.first_name
  end

  column(:activity) do |model|
    model.activity.name
  end

  column(:starts_at, header: "Start") do |model|
    model.starts_at
  end

  column(:stops_at, header: "End") do |model|
    model.stops_at.present? ? model.stops_at : "In Progress..."
  end

  column(:minutes, header: "Duration") do |model|
    model.minutes
  end

  column(:tokens) do |model|
    model.tokens.try(:round, 2)
  end

  column(:links, header: "", html: true) do |model|
    render partial: "parents/time_logs/columns/links", locals: { time_log: model }
  end

end
