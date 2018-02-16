$(document).ready(function() {

  function requestSentButton(button) {
    button.html('Request sent');
    button.prop('disabled', true);
  }

  $(document).on('click', '.request-button', function() {
    button = $(this);
    ids = button.attr('id');
    $.post('/requests', {id: ids}, function() {
      requestSentButton(button);
    });
  })

});
