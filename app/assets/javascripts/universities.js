
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
  if (active == "height"){
    button_h.classList.remove("large-btn");
    button_h.classList.add("large-btn_active");

    button_m.classList.remove("large-btn_active");
    button_m.classList.add("large-btn");
  } else {
    
    button_m.classList.remove("large-btn");
    button_m.classList.add("large-btn_active");

    button_h.classList.remove("large-btn_active");
    button_h.classList.add("large-btn");
  };
};




var SetActionHeight = function(){
  var magis = document.getElementsByClassName("magis");
  for (i = 0; i < magis.length; i++){
    magis[i].style.display = 'none';
  };
  active = "height";
  button_active();
  resetDepartament();
};


var SetActionMagis = function(){
  var special = document.getElementsByClassName("special");
  for (i = 0; i < special.length; i++){
    special[i].style.display = 'none';
  };
  active = "magis";
  button_active();
  resetDepartament();
};


function resetDepartament() {   
  var open_departs = document.getElementsByClassName("departament_row_open");
  for (i = 0; i < open_departs.length; i++){
    var something = open_departs[i];
      open_departs[i].classList.remove("departament_row_open") 
      something.classList.add("departament_row");
  };
};


function showHide(element_id) {

  if (document.getElementById(element_id + "departament"))
  { 
    
    if (active == "height"){ 

      var spec = document.getElementById("spec_" + element_id);

      if (spec.style.display != "block") 
      { 
        spec.style.display = "block"; 
      }
      else 
      {
        spec.style.display = "none"; 
      };
    } else {
      var magis = document.getElementById("magis_" + element_id);

      if (magis.style.display != "block") 
      { 
        magis.style.display = "block"; 
      }
      else 
      {
        magis.style.display = "none"; 
      };
    };
  };  
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

window.onload = function() {
  button_active();
} 

