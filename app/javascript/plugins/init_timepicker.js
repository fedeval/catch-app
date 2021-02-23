import timepicker from 'timepicker';


const initTimepicker = () => {
  
  const currentHour = parseInt(document.getElementById('new_booking').dataset.currentHour, 10)
  const currentMinutes = parseInt(document.getElementById('new_booking').dataset.currentMinutes, 10)
  let minTime = calculateMinTime(currentHour, currentMinutes)

  $('#booking_start_time').timepicker({
    'disableTextInput': true,
    'timeFormat': 'H:i',
    'show2400': true,
    'step': 10,
    'minTime': minTime,
    'maxTime': (parseInt(minTime, 10) + 3).toString(),
    'listWidth': 1,
  });
}

const calculateMinTime = (currentHour, currentMinutes) => {
  let minMinutes = 0; 
  if (currentMinutes >= 50) {
    minMinutes = 0;
  } else if (currentMinutes === 0) {
    minMinutes = 10;
  } else {
    minMinutes = Math.ceil(currentMinutes/10) * 10;
  }
  let minHour = 0;
  if (minMinutes === 0 && currentHour !== 23) {
    minHour = currentHour + 1;
  } else if (minMinutes === 0 && currentHour === 23) {
    minHour = 0;
  } else {
    minHour = currentHour;
  }
  return `${minHour}:${minMinutes}`;
}
 
export { initTimepicker };