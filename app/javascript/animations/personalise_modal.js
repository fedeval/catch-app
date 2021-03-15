const personaliseModal = () => {
  $('#instant-modal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var user = button.data('user');
    var modal = $(this);
    modal.find('.modal-message').text('A call with ' + user + ' has been added to your dashboard.');
  })
}

export { personaliseModal };