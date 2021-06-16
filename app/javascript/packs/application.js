// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "../stylesheets/application.scss"
import "@fortawesome/fontawesome-free/css/all"


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("moment")
require("popper.js").default

import "bootstrap"
import "../stylesheets/application"
import toastr from 'toastr'
import * as Routes from 'routes.js.erb';
//= require ckeditor-jquery
//= require jquery
//= require sweetalert
// require("packs/hover")
//= require jquery-ui/autocomplete
//= require jquery-ui
//= require moment
//= require select2


window.toastr = toastr
window.Routes = Routes;


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(function () {
  $('.navbar-toggler').click(function () {
      $('body').toggleClass('noscroll');
  })
});
$(function(){
  $("#addClass").click(function () {
    $('#qnimate').addClass('popup-box-on');
  });
    
  $("#removeClass").click(function () {
    $('#qnimate').removeClass('popup-box-on');
  });
})


$(document).ready(function (e) {
  $('#action_menu_btn').click(function(){
    $('.action_menu').toggle();
  });
  const toggleSwitch = $(document).find('.theme-switch input#change-theme');
  const currentTheme = localStorage.getItem('theme');

  if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark') {
      toggleSwitch.checked = true;
    }
  }

  function switchTheme(e) {
    if (e.is(':checked')) {
      document.documentElement.setAttribute('data-theme', 'dark');
      localStorage.setItem('theme', 'dark');
    }
    else {
      document.documentElement.setAttribute('data-theme', 'light');
      localStorage.setItem('theme', 'light');
    }
  }

  // toggleSwitch.addEventListener('change', switchTheme, false);

  $(document).on('click', '.mode-container', function (e) {
    if (toggleSwitch.is(':checked')){
      toggleSwitch.prop('checked', false);
    }else{
      toggleSwitch.prop('checked', true);
    }
    switchTheme(toggleSwitch);
  })
  
  $(document).on('click', '.search-right', function (e) {
    $(document).find('.pop-overlay').css('visibility', 'visible').css('opacity', '1');
  })

})
