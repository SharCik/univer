
var active = "height";

var magis = document.getElementsByClassName("magis");
var special = document.getElementsByClassName("special");
var departs = document.getElementsByClassName("departament_row");
var open_departs = document.getElementsByClassName("departament_row_open");
var button_h = document.getElementById("button_height");
var button_m = document.getElementById("button_magis");

var button_active  = function(){
  var button_h = document.getElementById("button_height");
  var button_m = document.getElementById("button_magis");
  if ((active == "height")&&(button_h)){
    button_h.classList.remove("large-btn");
    button_h.classList.add("large-btn_active");

    button_m.classList.remove("large-btn_active");
    button_m.classList.add("large-btn");
  } else if (button_h) {
    
    button_m.classList.remove("large-btn");
    button_m.classList.add("large-btn_active");

    button_h.classList.remove("large-btn_active");
    button_h.classList.add("large-btn");
  };
};

var SetActionHeight = function(){
  $('.special-depart').removeClass('hide');
  $('.magis-depart').addClass('hide');
  active = "height";
  button_active();
  resetDepartaments();
};


var SetActionMagis = function(){
  $('.special-depart').addClass('hide');
  $('.magis-depart').removeClass('hide');
  active = "magis";
  button_active();
  resetDepartaments();
};





function showHideMagis(element_id) {
  var id = "magis_" + element_id,
      element = $('#' + id);  
  if (element.hasClass('hide')){
    element.removeClass('hide');
  } else {
    element.addClass('hide');
  };
 
};

function showHideHeight(element_id) {
  var id = "spec_" + element_id,
      element = $('#' + id); 
  if (element.hasClass('hide')){
    element.removeClass('hide');
  } else {
    element.addClass('hide');
  };
 
};

function resetDepartaments() {
  var departs = $('.departament_row_open');
  $('.magis').addClass('hide');
  $('.spec').addClass('hide');
  departs.removeClass('departament_row_open');
  departs.addClass('departament_row');
};



function changeColor(element_id) {
  var obj = document.getElementById(element_id);

  if (obj.className != 'container departament_row')
  {
    obj.className = 'container departament_row';
  } else {
    obj.className = 'container departament_row_open';
  };
};



$(function() {
  $('.slider').slider();
});


function slider(){
  var mySlider = $("input.slider").slider();

  // Call a method on the slider
  var value = mySlider.slider('getValue');

  // For non-getter methods, you can chain together commands
      mySlider
          .slider('setValue', 5)
          .slider('setValue', 7);
};


$(document).ready(function(){
    $(".hiddenSelect").change(function(){ 
      $(this).nextAll(".visibleInput").val($(this).val());
    });
  
});


window.onload = function() {
  button_active();
} 

