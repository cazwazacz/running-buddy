$(document).ready(function() {

  function requestAccepted(button) {
    button.html('Accepted');
    button.prop('disabled', true);
  }

  $(document).on('click', '.accept-button', function() {
    var button = $(this);
    var ids = button.attr('id');
    $.ajax('/requests/' + ids, {
      method: 'PUT'
    }).done(function() {
      requestAccepted(button);
    })
  })

  $(document).on('click', '.clear-button', function() {
    var button = $(this);
    var parent = button.parent();
    parent.remove();
  })

})
