const emoji_rain = () => {

};

const sendFriendRequest = () => {
  const addButton = document.getElementById('add');
  const pendingButton = document.getElementById('pending');
  if (!addButton) return;

  addButton.addEventListener('click', function(event) {
    addButton.classList.add('hidden');
    pendingButton.classList.remove('hidden');
  })
}

export { sendFriendRequest };