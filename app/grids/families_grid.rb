class FamiliesGrid  < ApplicationGrid

  scope do
    Family.all
  end

  column(:name)

  column(:kids_count) do |model|
    model.kids.unscoped.count
  end

  column(:token_value)

end
