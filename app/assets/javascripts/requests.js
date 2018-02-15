$(document).ready(function() {
  $('.accept-button').on('click', function() {
    button = $(this);
    ids = button.attr('id');
    $.ajax('/requests/' + ids, {
      method: 'PUT'
    }).done(function() {
      requestAccepted(button);
    })
  })
})

function requestAccepted(button) {
  button.html('Accepted');
  button.prop('disabled', true);
}
