class ApplicationPresenter < SimpleDelegator

  def initialize(model)
    # make this available for anytime we need the generic model
    @model = model

    instance_variable_set("@#{sanitize_model_class(model.class.name)}".to_sym, model)
    super(instance_variable_get("@#{sanitize_model_class(model.class.name)}".to_sym))
  end

  def sanitize_model_class(model_class)
    model_class.gsub(":", "")
  end

  def display_title
    @model.to_s
  end

  def reload_object
    class_name = @model.class.name
    Object.send(:remove_const, class_name.to_sym)
    load "app/models/#{class_name.underscore}.rb"
    @model = class_name.constantize.new
  end

end
