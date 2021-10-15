$(document).ready(function () {
	$("form.button_to").on("ajax:success", function (event, xhr, status, error) {
		$(".add-to-slip").addClass("disabled");
	});
});
