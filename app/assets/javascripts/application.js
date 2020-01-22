//= require jquery3.min
//= require popper
//= require bootstrap-sprockets
//= require flatpickr

document.addEventListener('DOMContentLoaded', function() {
  flatpickr('.created-at', {
    altInput: true,
    altFormat: "F j, Y H:i",
    dateFormat: "Y-m-d H:i:s",
    enableTime: true,
    time_24hr: true,
  });
})
