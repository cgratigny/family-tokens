class ApplicationGrid
  include Datagrid

  attr_accessor :prepend_header, :append_header, :prepend_body, :append_body, :row_partial, :card_partial, :row_classes

  def row_id(asset)
    "id=parent-#{asset.id}"
  end

  def filters_hash
    hash = Hash.new
    filters.each do |filter|
      hash[filter.name] = filter_value(filter)
    end
    hash
  end

end
