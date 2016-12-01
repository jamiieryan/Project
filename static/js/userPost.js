$(function() {
    $('button').click(function() {
        
        var post = $('#txtPost').val();
        
        $.ajax({
            url: '/userPost',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
        
        location.reload();
    });
});