// This is example code to set browser cookies. Assuming that your app uses jQuery and jquery-cookie libraries.
// These methods need to be there ideally on each page.

var set_browser_offsets = function() {
  var winterOffset = -1 * (new Date(2010, 11, 21)).getTimezoneOffset() * 60;
  var summerOffset = -1 * (new Date(2010, 5, 21)).getTimezoneOffset() * 60;
  $.cookie('utc_offset_summer', summerOffset);
  $.cookie('utc_offset_winter', winterOffset);
}

$(document).ready(function () {
  set_browser_offsets();
});

$(document).ajaxStart(function () {
  set_browser_offsets();
});
 