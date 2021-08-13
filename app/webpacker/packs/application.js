// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../stylesheets/application"
import "./custom"
import "@fortawesome/fontawesome-free/js/all"
import 'select2/dist/css/select2.css'
import 'select2'

window.addEventListener('DOMContentLoaded', () => {
  $('.select2').select2({
    tags: true,
    createTag: function (params) {
      var term = $.trim(params.term);

      return {
        id: term,
        text: term,
        newTag: true // add additional parameters
      }
    }
  });
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery3
//= require popper
//= require bootstrap
