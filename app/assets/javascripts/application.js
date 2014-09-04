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
//= require bootstrap.min
//= require jquery.ui.all
//= require select2
//= require_tree .

$(document).on('ready page:load',function() {
// DatePicker
	$('#job_start_date').datepicker({ minDate: -20, maxDate: "+1M +10D", closeText: true, constrainInput: true, dateFormat: "dd-mm-yy" });
	$("#job_start_date").datepicker('hide');
	$('.button-datepicker').click(function ()
	{
	  $('#job_start_date').datepicker('show');
	});
// Select2	
	$('#skill_select').select2({
    width: "300px",
    placeholder: "Специалист",
    allowClear: true
	});

	$('#skill_select1').select2({
    width: "300px",
    placeholder: "Населенный пункт"
	});
	
	
	$(function(){ 
		$('#user-tab a').click(function (e) {
	  	e.preventDefault();
	  	$(this).tab('show');
		})
	});	

  $(window).scroll(function(){

    if ($(this).scrollTop() > 60) {
        $('.skill-list').addClass('fixed');
    } else {
        $('.skill-list').removeClass('fixed');
    }
  });

});

