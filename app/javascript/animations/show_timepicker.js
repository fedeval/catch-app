const showTimepicker = () => {
  const trigger = document.getElementById('hide-show');

  trigger.addEventListener("click", function() {
    trigger.classList.add('hidden');
    const form = document.getElementById('timepicker');
    form.classList.remove('hidden');
    const instantMatches = document.querySelector('.instant-matches-list');
    instantMatches.classList.add('hidden');
  });
}

export { showTimepicker };