$(document).ready(function() {
  $('.accept-button').on('click', function() {
    button = $(this);
    ids = button.attr('id');
    $.ajax('/requests/1', {
      method: 'PUT',
      data: { ids: ids }
    }).done(function() {
      requestAccepted(button);
    })
  })
})

function requestAccepted(button) {
  button.html('Accepted');
  button.prop('disabled', true);
}
