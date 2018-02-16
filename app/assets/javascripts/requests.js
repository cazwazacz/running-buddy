$(document).ready(function() {

  function requestAccepted(button) {
    button.html('Accepted');
    button.prop('disabled', true);
  }

  $(document).on('click', '.accept-button', function() {
    button = $(this);
    ids = button.attr('id');
    $.ajax('/requests/' + ids, {
      method: 'PUT'
    }).done(function() {
      requestAccepted(button);
    })
  })

})
