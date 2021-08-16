(function() {
  document.addEventListener("turbolinks:load", function(){
    $( ".toggle-trigger" ).click(function(e) {
      if ($("#" + $(this).data("target")).hasClass("hide"))
      {
        $("#" + $(this).data("target")).removeClass("hide");
      }
      else
      {
        $("#" + $(this).data("target")).addClass("hide");
      }
      // alert(e.data("target"));
    });
  });
}).call(this);
