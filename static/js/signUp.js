$(function(){
	$('#btnSignUp').click(function(){
		
		$.ajax({
			url: '/signUp',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
                window.location = ('/');  // redirect browser to link
			},
			error: function(error){
				console.log(error);
			}
		});
        
	});
});
