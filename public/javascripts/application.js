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
		var salary = $('input#calculator_salary').val();
		average_sick_days(sick_days, employee);
		total_salary_sick_days(salary, sick_days, employee)
		employee_salary_sick_days(salary, sick_days, employee)
	});
});

function average_sick_days(sick_days, employee) {
	var average_sick_days = (sick_days / employee).toFixed(2);
	return isNaN(average_sick_days) ? $('input#calculator_average_sick_days').val("") : $('input#calculator_average_sick_days').val(average_sick_days);
};

function total_salary_sick_days(salary, sick_days, employee) {
	var total_salary_sick_days = (salary / employee * sick_days / 260).toFixed(2);
	return isNaN(total_salary_sick_days) ? $('input#calculator_total_salary_sick_days').val("") : $('input#calculator_total_salary_sick_days').val(total_salary_sick_days);
};

function employee_salary_sick_days(salary, sick_days, employee) {
	var employee_salary_sick_days = (salary / employee * sick_days / 260 / employee).toFixed(2);
	return isNaN(employee_salary_sick_days) ? $('input#calculator_employee_salary_sick_days').val("") : $('input#calculator_employee_salary_sick_days').val(employee_salary_sick_days);
};

//Observe Revenue fields
$(document).ready(function(){
	$('input#calculator_revenue').live('keyup', function(event) {
		var revenue = $('input#calculator_revenue').val();
		var employee = $('input#calculator_employee').val();
		average_revenue(revenue, employee);
	});
});

function average_revenue(revenue, employee) {
	var average_revenue = (revenue / employee).toFixed(2);
	return isNaN(average_revenue) ? $('input#calculator_revenue_employee').val("") : $('input#calculator_revenue_employee').val(average_revenue);
};

//Observe Savings fields
$(document).ready(function(){
	$('input#calculator_sick_days_reduction').live('keyup', function(event) {
		var sick_days = $('input#calculator_sick_days').val();
		var employee = $('input#calculator_employee').val();
		var sick_days_reduction = $('input#calculator_sick_days_reduction').val();
		new_sick_days(sick_days, employee, sick_days_reduction);
		// total_losses(sick_days, employee, sick_days_reduction);
		total_savings(sick_days, employee, sick_days_reduction);
		employee_savings(sick_days, employee, sick_days_reduction);
	});
});

function new_sick_days(sick_days, employee, sick_days_reduction) {
	var new_sick_days = (sick_days / employee - sick_days_reduction).toFixed(2);
	return isNaN(new_sick_days) ? $('input#calculator_new_sick_days').val("") : $('input#calculator_new_sick_days').val(new_sick_days);
};

function total_losses(sick_days, employee, sick_days_reduction) {
	var total_losses = (sick_days / employee - sick_days_reduction).toFixed(2);
	return isNaN(total_losses) ? $('input#calculator_total_losses').val("") : $('input#calculator_total_losses').val(total_losses);
};

function total_savings(sick_days, employee, sick_days_reduction) {
	var total_losses = $('input#calculator_total_losses').val();
	var total_savings = (total_losses * (sick_days_reduction * employee) / sick_days).toFixed(2);
	return isNaN(total_savings) ? $('input#calculator_total_savings').val("") : $('input#calculator_total_savings').val(total_savings);
};

function employee_savings(sick_days, employee, sick_days_reduction) {
	var total_losses = $('input#calculator_total_losses').val();
	var total_savings = (total_losses * (sick_days_reduction * employee) / sick_days);
	var employee_savings = (total_savings / employee).toFixed(2);
	return isNaN(employee_savings) ? $('input#calculator_employee_savings').val("") : $('input#calculator_employee_savings').val(employee_savings);
};
