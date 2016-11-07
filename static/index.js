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
        
        $("#pre").slideUp(500);
        //$("#pre").animate({width:'toggle'},500);
        
        
        //hides what's inside selected div and replaces it with item to be loaded 
        $("#main").load("/route2",function(){}).hide().delay( 750 ).slideDown(750).fadeIn(1500);
        
    });
    
    
    
    
});
