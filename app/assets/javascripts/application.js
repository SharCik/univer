// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-select
//= require bootstrap
//= require bootstrap/modal
//= require bootstrap-slider
//= require bootstrap-wysihtml5
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .





var ready;


function closeModalWindow(){
  $("#modal-window").removeClass("show");
  $("#modal-window").addClass("hide");
};





$(document).ready(ready);
// if using turbolinks
$(document).on("page:load",ready);


$(function() {
  $( "#'button-filter" ).click(function() {
    $( "#'button-filter" ).addClass( "onclic", 250, validate);
  });

  function validate() {
    setTimeout(function() {
      $( "#'button-filter" ).removeClass( "onclic" );
      $( "#'button-filter" ).addClass( "validate", 450, callback );
    }, 2250 );
  }
    function callback() {
      setTimeout(function() {
        $( "#'button-filter" ).removeClass( "validate" );
      }, 1250 );
    }
  });





