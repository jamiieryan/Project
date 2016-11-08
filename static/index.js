//fullscreen menu toggle
$('#toggle').click(function() {
   $(this).toggleClass('active');
   $('#overlay').toggleClass('open');
  });



//fadeIn route2 div
$(document).ready(function(){
   
    
    //$("#anchor").click(function(event) {});
    
    
    //based on #anchor click
    $("#anchor").click(function(){
        
        $("#hide").fadeOut(750);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route2",function(){}).hide().delay( 750 ).fadeIn(1250);
        
    });
    
    //based on #anchor click
    $("#anchor2").click(function(){
        
        $("#hide").slideUp(500);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route3",function(){}).hide().delay( 750 ).slideDown(250);
        
    });
    
    
    
    
});






