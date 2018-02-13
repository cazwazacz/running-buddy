$(document).ready(function() {
  $('.request-button').on('click', function() {
    button = $(this);
    ids = button.attr('id');
    $.post('/requests', {id: ids}, function() {
      requestSentButton(button);
    });
  })
});

function requestSentButton(button) {
  button.html('Request sent');
  button.prop('disabled', true);
}
