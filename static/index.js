//fullscreen menu toggle
$('#toggle').click(function() {
   $(this).toggleClass('active');
   $('#overlay').toggleClass('open');
  });



//Slider-Info click events
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
        
        $("#hide").fadeOut(750);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route3",function(){}).hide().delay( 750 ).fadeIn(1250);
        
    });
    
    //based on #anchor click
    $("#anchor3").click(function(){
        
        $("#hide").fadeOut(750);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route4",function(){}).hide().delay( 750 ).fadeIn(1250);
        
    });
    
    //based on #anchor click
    $("#anchor4").click(function(){
        
        $("#hide").fadeOut(750);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route5",function(){}).hide().delay( 750 ).fadeIn(1250);
        
    });
 
    
});






