(function() {
  document.addEventListener("turbolinks:load", function() {
    var clear_form_values, get_select_value, hide_form_elements, show_form_elements;
    get_select_value = function(e) {
      var select_value;
      if ($(e).prop('type') === "checkbox") {
        if ($(e).is(':checked')) {
          select_value = "checked";
        } else {
          select_value = "unchecked";
        }
      } else if ($(e).prop('type') === "radio") {
        if ($(e).is(':checked')) {
          select_value = $(e).val();
        } else {
          select_value = "unchecked";
        }
      } else {
        select_value = $(e).val();
      }
      return select_value;
    };
    hide_form_elements = function(e) {
      var data_hide_options;
      data_hide_options = $(e).data("hide");
      return $.each(data_hide_options[get_select_value(e)], function(index, value) {
        var element;
        element = $("body").find("[data-logic-label='" + value + "']");
        element.addClass("hide").fadeOut();
        element.find("input[type=text], input[type=number], textarea").keyup();
        return element.find(".chosen-container").removeClass('chosen-with-drop');
      });
    };
    clear_form_values = function(e) {
      var data_hide_options;
      data_hide_options = $(e).data("hide");
      return $.each(data_hide_options[get_select_value(e)], function(index, value) {
        return $("body").find("[data-logic-label='" + value + "']").find("input[type=text], input[type=number], textarea").val("");
      });
    };
    show_form_elements = function(e) {
      var data_show_options, fields, mobile_detected;
      data_show_options = $(e).data("show");
      $.each(data_show_options[get_select_value(e)], function(index, value) {
        return $("body").find("[data-logic-label='" + value + "']").removeClass('hide').fadeIn();
      });
      mobile_detected = $('body').hasClass('mobile_detected');
      // fields = new Fields;
      // return fields.renderAll();
    };
    $('.hide-elements').each(function(i, obj) {
      return hide_form_elements(obj);
    });
    $('.show-elements').each(function(i, obj) {
      return show_form_elements(obj);
    });
    $("body").on('change', '.hide-elements', function(e) {
      hide_form_elements(this);
      return clear_form_values(this);
    });
    return $("body").on('change', '.show-elements', function(e) {
      return show_form_elements(this);
    });
  });

}).call(this);
