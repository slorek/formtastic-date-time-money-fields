// Check jQuery is the framework installed.
if (jQuery) {  
	
	$(document).ready(function() {
		
		// Enable date/time pickers
		$('.datetime input').datetimepicker({dateFormat: 'MM dd, yy'});
		$('.date input').datepicker({dateFormat: 'MM dd, yy'});
	});
}