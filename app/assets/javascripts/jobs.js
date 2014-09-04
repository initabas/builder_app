$(document).on('ready page:load',function() {
	$('#skill_select').select2({
    width: "300px",
    //triggerChange: true,
    allowClear: true,
	}).on("change", function(e) {
          // mostly used event, fired to the original element when the value changes
    console.log(e.val);
    $.ajax({
        url: "/accepted_jobs",
        type: "GET",
        dataType: "script",
        data: ({
					skill_id: e.val
        })
    });
   });
});