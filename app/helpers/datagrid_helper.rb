module DatagridHelper

  def datagrid_cards(grid, *args)
    options = args.extract_options! || {}
    render partial: "common/datagrid/cards_list", locals: { grid: grid, assets: grid.assets, options: options }
  end

  def datagrid_grid_class(controller, grid, options=nil)
    cols_class = "grid-cols-#{options[:card_cols] || 4}"
    @grid_class ||= "#{grid.class.name.underscore.dasherize} #{cols_class} #{controller.controller_path.dasherize.gsub("/", "-")}-grid grid-context-#{controller.controller_path.split('/').first.dasherize}"
  end

  def datagrid_card_class(controller, grid, asset, options=nil)
    card_classes = grid.html_columns(*options[:columns]).select{ |c| (c.name == :card_classes) }.first
    if card_classes.present?
      additional_classes = datagrid_value(grid, card_classes, asset)
    end
    status = grid.html_columns(*options[:columns]).select{ |c| (c.name == :status) }.first
    status_class = "#{grid.class.name.underscore.to_s.downcase.tr(" ", "_").dasherize}-status status-#{datagrid_value(grid, :status, asset).to_s.underscore.downcase.tr(" ", "_").dasherize}" if status.present?

    "#{grid.class.name.underscore.to_s.downcase.tr(" ", "_").dasherize}-card #{status_class.to_s} card-context-#{controller.controller_path.split('/').first.dasherize} #{additional_classes}"
  end

  def datagrid_footer_icon(icon_label, fa_icon=nil, icon_text=nil, icon_link=nil)
    if icon_link
      render partial: "common/icons/icon_with_label_and_link", locals: {  icon_text: icon_text, fa_icon: fa_icon, icon_label: icon_label, icon_size: "small-icon", icon_link: icon_link }
    else
      render partial: "common/icons/icon_with_label", locals: {  icon_text: icon_text, fa_icon: fa_icon, icon_label: icon_label, icon_size: "small-icon" }
    end
  end

end
