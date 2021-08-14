$ ->
  get_select_value =(e) ->
    if $(e).prop('type') == "checkbox"
      if $(e).is(':checked')
        select_value = "checked"
      else
        select_value = "unchecked"
    else if $(e).prop('type') == "radio"
      if $(e).is(':checked')
        select_value = $(e).val()
      else
        select_value = "unchecked"
    else
      select_value = $(e).val()
    select_value

  hide_form_elements =(e) ->
    data_hide_options = $(e).data("hide")

    $.each data_hide_options[get_select_value(e)], (index, value) ->
      element = $("body").find("[data-logic-label='" + value + "']")
      element.addClass("hide")
      element.find("input[type=text], input[type=number], textarea").keyup();
      element.find(".chosen-container").removeClass('chosen-with-drop');

  clear_form_values =(e) ->
    data_hide_options = $(e).data("hide")

    $.each data_hide_options[get_select_value(e)], (index, value) ->
      $("body").find("[data-logic-label='" + value + "']").find("input[type=text], input[type=number], textarea").val("");

  show_form_elements =(e) ->
    data_show_options = $(e).data("show")

    $.each data_show_options[get_select_value(e)], (index, value) ->
      $("body").find("[data-logic-label='" + value + "']").removeClass('hide').fadeIn()

    # copied from main.coffee
    mobile_detected = $('body').hasClass('mobile_detected')
    fields = new Fields
    fields.renderAll()

  $('.hide-elements').each (i, obj) ->
    hide_form_elements(obj)

  $('.show-elements').each (i, obj) ->
    show_form_elements(obj)

  $("body").on 'change', '.hide-elements', (e) ->
    hide_form_elements(this)
    clear_form_values(this)

  $("body").on 'change', '.show-elements', (e) ->
    show_form_elements(this)
