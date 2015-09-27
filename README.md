
Handle browser time zone in rails apps...

The purpose of this gem is to track browser's timezone and run rails controller code in the time zone
detected for each request.

Instructions to use --

1. Install the gem.

2. Include the around filter in every controller that needs to run code in user's timezone. If you need it for all controllers obviously add it to the application controller.

3. Add the js code that sets the browser offsets in your js files. Code can be found in assets directory based on the js lib you use.

To do --

1. For now, works with Rails 2 and Rails 3. Rails 4 support is coming soon.

2. Add specs and tests.

Reference --

To be updated.
