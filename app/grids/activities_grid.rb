class ActivitiesGrid < ApplicationGrid

  scope do
    Activity.all
  end

  column(:name)

  column(:token_duration)

  column(:token_affect) do |model|
    model.token_affect.text
  end

  column(:links, header: "", html: true) do |model|
    render partial: "parents/activities/columns/links", locals: { activity: model }
  end

end
