// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var $isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return ($isMobile.Android() || $isMobile.BlackBerry() || $isMobile.iOS() || $isMobile.Opera() || $isMobile.Windows());
    }
};

function scrollToElement(id){
	console.log('to ' + id);
	$('body').animate({scrollTop: $('#' + id).position().top - 50},1000); 
	return false;
}

function scrollToTop(){
		console.log('to top');
	$('body').animate({scrollTop: 0},1000); 
	return false;
}

$(document).ready(function(){
	if(!$isMobile.any()) return;
	// for mobile devices, anything with a class of full should be hidden, only on displayed on full screens
	$('.full').hide();
});