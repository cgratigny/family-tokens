class RewardsGrid < ApplicationGrid

  scope do
    Reward.all
  end

  column(:name)

  column(:tokens)

  column(:disabled, header: "Visibility") do |model|
    model.archived? ? "Archived" : "Active"
  end

  column(:links, header: "", html: true) do |model|
    render partial: "parents/rewards/columns/links", locals: { reward: model }
  end


end
