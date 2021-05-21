class TransactionsGrid  < ApplicationGrid

  scope do
    Transaction.all
  end

  column(:kid)

  column(:description)

  column(:amount)

  column(:tokens) do |model|
    if model.type.affects_tokens?
      model.tokens
    else
      " - "
    end
  end

  column(:type) do |model|
    model.type.text
  end

  column(:links, header: "", html: true) do |model|
    render partial: "parents/transactions/columns/links", locals: { transaction: model }
  end

end
