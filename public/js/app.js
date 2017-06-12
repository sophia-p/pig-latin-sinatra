$(document).ready(function(){
	$('#new-word-form').on('submit', function(event){
		event.preventDefault();
		var url = $(this).attr('action'),
			method = $(this).attr('method'),
			data = $(this).serialize();
		$.ajax({
			url: url,
			method: method,
			data: data
		})
		.done(function(response){
			$('.word-table').append(response);
			$('#new-word-form').trigger('reset');
		})
		.fail(function(response){
			alert(response.responseText);
		})
	})
})