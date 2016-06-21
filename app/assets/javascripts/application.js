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
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .




function showHide(element_id) {
  //Если элемент с id-шником element_id существует
  if (document.getElementById(element_id)) { 
    //Записываем ссылку на элемент в переменную obj
    var obj = document.getElementById(element_id); 
    //Если css-свойство display не block, то: 
    if (obj.style.display != "block") { 
      obj.style.display = "block"; //Показываем элемент
    }
      else obj.style.display = "none"; //Скрываем элемент
    }
}   



function changeColor(element_id) {
  if (document.getElementById(element_id)) { 
    var obj = document.getElementById(element_id);
    if (obj.style.backgroundColor != "#23599b") { 
      obj.style.backgroundColor = "#23599b";
      obj.style.color = "#fff";
    } else {
      obj.style.backgroundColor = "#fff";}
  }
}