// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min.js
//= require jquery.pjax
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .

//$(function() {
//  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')
//});


$(document).on('ready', function() {
	$("textarea").materialnote();
	
	clicked = 0 
	$( "#submit_button" ).on( "click", function() { clicked = 1; });
	$('#update_content_form').on('submit', function(e){
	    if(clicked == 0){ e.preventDefault();}
	});

});


