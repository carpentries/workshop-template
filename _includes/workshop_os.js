/* Based on https://stackoverflow.com/a/30894829/1802726 */
var show_instructions = function() {
     //set all nav tabs to inactive
    $('.nav-tabs li').removeClass('active');

    //get all nav tabs matching the os and set to active
    $('.nav-tabs li a[href*="'+localStorage.os+'"]').closest('li').addClass('active');

    //set all tabs to inactive
    $('.tab-pane').removeClass('active');

    //get all tabs matching the os and set to active
    $('.tab-pane[id*="'+localStorage.os+'"]').addClass('active');
}

if (typeof(Storage) !== "undefined") {
    if (localStorage.os == "undefined") {
        localStorage.os = "windows";
    }
    show_instructions();
} else {
    console.log("No localStorage");
}

/* Based on https://stackoverflow.com/a/30894829/1802726 */
$('.nav-tabs li a').click(function(){
    //get selected os
    localStorage.os = $(this)[0].dataset.os;    
    show_instructions();
});
