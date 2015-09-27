// This is example code to set browser cookies. Assuming that your app uses prototypejs
// These methods need to be there ideally on each page.

function set_cookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + "; " + expires;
}

function set_browser_offsets() {
  var winterOffset = -1 * (new Date(2010, 11, 21)).getTimezoneOffset() * 60;
  var summerOffset = -1 * (new Date(2010, 5, 21)).getTimezoneOffset() * 60;
  set_cookie('utc_offset_summer', summerOffset, 360);
  set_cookie('utc_offset_winter', winterOffset, 360);
}

document.observe("dom:loaded", function() {
  set_browser_offsets();
});

Ajax.Responders.register({
  onCreate: function () {
    set_browser_offsets();
  }
});
 