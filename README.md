
rails_browser_timezone
======================

The purpose of this gem is to track browser's timezone and run rails controller code in the time zone
detected for each request.

Instructions to use
==================

Installation -
--------------------

```
  gem 'rails_browser_timezone', '0.0.6', :git => 'https://github.com/udayakiran/rails_browser_timezone'

```

Usage -
---------

 1. Include the around filter in every controller that needs to run code in user's timezone. If you need it for all controllers obviously add it to the application controller.

``` 
 prepend_around_filter BrowserTimeZoneFilter #Rails < 4.2 (inlcuding Rails 2,3 and 4)

 prepend_around_action BrowserTimeZoneFilter #Rails 4.2+

```

  2. Add the js code that sets the browser offsets in your js files. Code can be found in assets directory based on the js lib you use.


To do -
-------

 Add specs and tests.

Reference -
----------

To be updated.
