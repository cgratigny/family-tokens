class KidsGrid  < ApplicationGrid

  scope do
    Kid.all
  end

  column(:first_name)

  column(:last_name)

  column(:date_of_birth)

  column(:token_balance, html: true) do |model|
    render partial: "parents/kids/columns/token_balance", locals: { kid: model }
  end

  column(:links, header: "", html: true) do |model|
    render partial: "parents/kids/columns/links", locals: { kid: model }
  end

end
