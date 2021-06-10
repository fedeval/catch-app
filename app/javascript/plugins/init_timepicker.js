import timepicker from 'timepicker';

const initTimepicker = () => {
  const newBooking = document.getElementById('new_booking'); 
  
  if (!newBooking) return;

  const currentHour = parseInt(newBooking.dataset.currentHour, 10)
  const currentMinutes = parseInt(newBooking.dataset.currentMinutes, 10)
  const unavailableTimes = newBooking.dataset.unavailableTimes
  console.log(unavailableTimes)
  const minTime = calculateMinTime(currentHour, currentMinutes)
  const jsonUT = JSON.parse(unavailableTimes);
  const userTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

  $('#booking_start_time').timepicker({
    'disableTextInput': true,
    'disableTimeRanges': jsonUT,
    'timeFormat': 'H:i',
    'show2400': true,
    'step': 10,
    'minTime': minTime,
    'maxTime': `${parseInt(minTime, 10) + 2}:${minTime.split(':')[1]}`,
    'listWidth': 1,
  });
}

const calculateMinTime = (currentHour, currentMinutes) => {
  let minMinutes = 0; 
  if (currentMinutes < 50) {
    minMinutes = Math.ceil((currentMinutes + 1)/10) * 10;
  }
  let minHour = currentHour;
  if (minMinutes === 0) {
    minHour = currentHour !== 23 ? currentHour + 1 : minHour = 0
  }
  return `${minHour}:${minMinutes}`;
}
 
export { initTimepicker };