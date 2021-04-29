// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()

require("bootstrap")
require("timeago")

require("@nathanvda/cocoon")

import "@fortawesome/fontawesome-free/css/all.css";

import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
  })
})

jQuery(document).ready(function() {
  jQuery("time.timeago").timeago();
});
