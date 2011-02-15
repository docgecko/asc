// Observe Employee fields
$(document).ready(function(){
	$('input#calculator_employee').live('keyup', function(event) {
		var employee = $('input#calculator_employee').val();
		if ($('input#calculator_salary').val() > 0) {
			var salary = $('input#calculator_salary').val();
			average_salary(salary, employee);
		}
	});
});

$(document).ready(function(){
	$('input#calculator_salary').live('keyup', function(event) {
		var salary = $('input#calculator_salary').val();
		if ($('input#calculator_employee').val() > 0) {
			var employee = $('input#calculator_employee').val();
			average_salary(salary, employee);
		}
	});
});

function average_salary(salary, employee) {
	var average_salary = (salary / employee).toFixed(2);
	return isNaN(average_salary) ? $('input#calculator_average_salary').val("") : $('input#calculator_average_salary').val(average_salary);
};

//Observe Absence fields
$(document).ready(function(){
	$('input#calculator_sick_days').live('keyup', function(event) {
		var sick_days = $('input#calculator_sick_days').val();
		var employee = $('input#calculator_employee').val();
		average_sick_days(sick_days, employee);
	});
});

function average_sick_days(sick_days, employee) {
	var average_sick_days = (sick_days / employee).toFixed(2);
	return isNaN(average_sick_days) ? $('input#calculator_average_sick_days').val("") : $('input#calculator_average_sick_days').val(average_sick_days);
};

	