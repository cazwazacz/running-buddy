document.addEventListener('DOMContentLoaded', function() {
  var button = document.getElementById('change-button');

  button.addEventListener('click', function() {
    document.getElementById('heading').innerText = 'wazap';
  })
})
