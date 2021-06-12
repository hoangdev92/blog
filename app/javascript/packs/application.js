// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "../stylesheets/application.scss"


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


import "bootstrap"
import "../stylesheets/application"

//= require ckeditor-jquery
//= require jquery
//= require sweetalert



import toastr from 'toastr'
window.toastr = toastr

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


$(document).ready(function (e) {
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
