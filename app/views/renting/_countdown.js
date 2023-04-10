import "jquery";


$( document ).ready(function() {


    // Set the date we're counting down to
    var countDownDate = new Date($('.temp_information').data('temp')).getTime();

    // Update the count down every 1 second
    var x = setInterval(function() {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var s = Math.floor((distance % (1000 * 60)) / 1000);

    var hDisplay = h > 0 ? (h < 10 ? "0" + h + ":" : h + ":") : "00:";
    var mDisplay = m > 0 ? (m < 10 ? "0" + m + ":" : m + ":") : "00:";
    var sDisplay = s > 0 ? (s < 10 ? "0" + s : s) : "00";

    // Display the result in the element with id="demo"
    document.getElementById("clock").innerHTML =  hDisplay+mDisplay+sDisplay;
    // If the count down is finished, write some text
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("clock").innerHTML = "<style= 'background-color:powderblue' > EXPIRED </style>" ;
    }
    }, 1000);

})

