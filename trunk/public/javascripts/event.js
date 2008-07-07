function getElementsByStyleClass(className){
    var all = document.all ? document.all : document.getElementsByTagName('*');
    var elements = new Array();
    for (var e = 0; e < all.length; e++) 
        if (all[e].className == className) 
            elements[elements.length] = all[e];
    return elements;
}

window.addEvent('domready', function(){
    var slide_menu = getElementsByStyleClass("slide_menu");
    
    for (var e = 0; e < slide_menu.length; e++) 
        $(slide_menu[e].id).addEvents({
            'mouseenter': function(){
                // Always sets the duration of the tween to 1000 ms and a bouncing transition
                // And then tweens the height of the element
                this.set('tween', {
                    duration: 1000,
                    transition: Fx.Transitions.Bounce.easeOut // This could have been also 'bounce:out'
                }).tween('height', '150px');
            },
            'mouseleave': function(){
                // Resets the tween and changes the element back to its original size
                this.set('tween', {}).tween('height', '20px');
            }
        });
});
