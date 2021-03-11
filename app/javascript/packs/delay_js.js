
const delay = document.getElementsByClassName("enter__text")[0];
delay.addEventListener("click", (event) => {

  setTimeout( function() { window.location = '/bookings' }, 2500 );
});

// window.onload = delay;
