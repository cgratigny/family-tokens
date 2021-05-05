class RedemptionsGrid < ApplicationGrid

  scope do
    Redemption.all
  end

  def row_class(asset)
    asset.fulfilled? ? "" : "text-danger"
  end

  column(:kid)

  column(:reward)

  column(:quantity)

  column(:fulfilled, header: "Given to Kid") do |model|
    model.fulfilled? ? "Yes" : "No"
  end

  column(:created_at, header: "Redemption Time")

  column(:links, header: "", html: true) do |model|
    render partial: "parents/rewards/columns/links", locals: { reward: model }
  end


end
