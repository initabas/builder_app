# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).ready ->
	  $("#skill_select").on "change", ->
	    $.ajax
	      url: "/accepted_jobs"
	      type: "GET"
	      dataType: "script"
	      data:
	        skill_id: $("#skill_select").val()