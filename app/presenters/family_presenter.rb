class FamilyPresenter < ApplicationPresenter

  def name
    @model.name || @model.username
  end

end
